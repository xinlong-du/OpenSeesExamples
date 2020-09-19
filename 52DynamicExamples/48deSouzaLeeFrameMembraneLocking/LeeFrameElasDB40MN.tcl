# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
#
# SET UP ----------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
#source LibUnits.tcl;			# define units
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model
# define GEOMETRY ------------------------------------------------------------------
#Nodes, NodeNumber, xCoord, yCoord, zCoord
for {set i 1} {$i<22} {incr i 1} {
	node $i 0.0 [expr -0.6+0.6*$i] 0.0;
}
for {set i 22} {$i<42} {incr i 1} {
	node $i [expr 0.6*($i-21)] 12.0 0.0;
}
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNodeB 11;
set MiddleNodeA 31;
set EndNode 41;
fix $StartNode 1 1 1 0 0 0;
fix $EndNode   1 1 1 0 0 0;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 210e9;		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
	set matID 1;
	uniaxialMaterial Elastic $matID $Es;
	# ELEMENT properties
	# beam-column sections: L5x3.5x5/16
	set J 4.704e-4;
	set GJ [expr $Gs*$J];
	set y0 0.0;
	set z0 0.0;
	
source RecSec.tcl;
	# assign torsional Stiffness for 3D Model
	#uniaxialMaterial Elastic $SecTagTorsion $GJ
	#section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0 -mass 471.0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/LeeFrameElasDB40MN.out -time -node $MiddleNodeA -dof 1 2 3 4 5 6 disp;			# displacements of middle node
#recorder Node -file $dataDir/CantileverReac.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"

# --------------------------------------------------------------------------------------------------
# DYNAMIC wind analysis -------------------------------------------------------------
#recorder Node -file $dataDir/DFreeWind100NR.out -time -node 119 128 -dof 3 disp;			# displacements of free node
#recorder Node -file $dataDir/RBaseWind100NR.out -time -node 93 66 34 4 -dof 3 reaction;		# support reaction
# create load pattern
set WindSeriesA "Series -dt 0.1 -filePath WindForceA100.txt -factor 1";	# define acceleration vector from file (dt=0.01 is associated with the input file gm)
#set WindSeriesB "Series -dt 1 -filePath windForce/WindForceB100.txt -factor 1";
#set WindSeriesD "Series -dt 1 -filePath windForce/WindForceD100.txt -factor 1";
#set WindSeriesF "Series -dt 1 -filePath windForce/WindForceF100.txt -factor 1";
pattern Plain 3 $WindSeriesA -fact 1000000 {
	load $MiddleNodeA  0.0 0.0 1.0 0.0 0.0 0.0;
	load $MiddleNodeB  0.0 0.0 -1.0 0.0 0.0 0.0;  
}

#recorder plot $dataDir/DFreeWind100.out Displ-X 1200 10 300 300 -columns 2 1; # a window to plot the nodal displacements versus time

#rayleigh 0. 0. 0. [expr 2*0.02/pow([eigen 1],0.5)];		# set damping based on first eigen mode

# create the analysis
# wipeAnalysis;					# clear previously-define analysis parameters
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-5 500;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25 ;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 800 0.001;

puts "Done!"