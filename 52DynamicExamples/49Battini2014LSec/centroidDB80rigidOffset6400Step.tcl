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
for {set i 1} {$i<82} {incr i 1} {
	node $i [expr -0.0625+0.0625*$i] 0 0;
}
node 82 2.5 [expr -0.054819277108434-0.009] [expr -0.029819277108434-0.009];
node 83 5.0 [expr -0.054819277108434-0.009] [expr -0.029819277108434-0.009];
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNode 41;
set EndNode 81;
set MiddleLoad 82;
set EndLoad 83;
fix $StartNode 1 1 1 1 1 1;
#fix $EndNode 0 1 1 1 1 1;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
set ColSecTag2 100
	# define MATERIAL properties 
	set Es 210e9;		# Steel Young's Modulus
	set nu 0.33;
	set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
	set matID 1;
	uniaxialMaterial Elastic $matID $Es;
	# ELEMENT properties
	# beam-column sections: L5x3.5x5/16
	set J 6.4541e-7;
	set GJ [expr $Gs*$J];
	set y0 -0.05258961;
	set z0 0.03359577;
	
source inpLsection.tcl
source inpLsectionOffset.tcl;
	# assign torsional Stiffness for 3D Model
	#uniaxialMaterial Elastic $SecTagTorsion $GJ
	#section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 -0.875598373888054 0.483039840639046 -jntOffset 0.0 -0.054819277108434 -0.029819277108434 0.0 -0.054819277108434 -0.029819277108434;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0 -mass 46.9116;	
} 
set IDColTransf2 200; 
geomTransf $ColTransfType $IDColTransf2 0 1 0;
element dispBeamColumn 81 $MiddleNode $MiddleLoad $numIntgrPts $ColSecTag2 $IDColTransf2 $y0 $z0;
element dispBeamColumn 82 $EndNode $EndLoad $numIntgrPts $ColSecTag2 $IDColTransf2 $y0 $z0;
# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/centroidDB80rigidOffset6400Step.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of end node
#recorder Node -file $dataDir/mixedFTBDispMidF0001P.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
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
# create load pattern
set WindSeriesA "Series -dt 0.0025 -filePath loadHistory.txt -factor 1";	# define acceleration vector from file (dt=0.01 is associated with the input file gm)
#set WindSeriesB "Series -dt 1 -filePath windForce/WindForceB100.txt -factor 1";
#set WindSeriesD "Series -dt 1 -filePath windForce/WindForceD100.txt -factor 1";
#set WindSeriesF "Series -dt 1 -filePath windForce/WindForceF100.txt -factor 1";
pattern Plain 3 $WindSeriesA -fact -35000 {
	   load $EndLoad 0.0 1.0 0.0 0.0 0.0 0.0;
	load $MiddleLoad 0.0 0.0 -1.0 0.0 0.0 0.0;  
}

#recorder plot $dataDir/DFreeWind100.out Displ-X 1200 10 300 300 -columns 2 1; # a window to plot the nodal displacements versus time

#rayleigh 0. 0. 0. [expr 2*0.02/pow([eigen 1],0.5)];		# set damping based on first eigen mode

# create the analysis
# wipeAnalysis;					# clear previously-define analysis parameters
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-5 2000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25 ;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 6400 0.00125;

puts "Done!"