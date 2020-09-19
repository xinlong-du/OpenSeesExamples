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
for {set i 1} {$i<42} {incr i 1} {
	node $i [expr -0.125+0.125*$i] 0 0;
}
node 43 5.0 [expr -0.054819277108434] [expr -0.029819277108434];
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNode 21;
set EndNode 41;
set EndLoad 43;
fix $StartNode 1 1 1 1 1 1;
#fix $EndNode 0 1 1 1 1 1;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
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

#set up rigid offsets
    set Jrig 1.04e-2; 
	set Arig 0.76;		# cross-sectional area
	set Iz 3.0e-3;		# moment of Inertia
	set Iy 3.0e-3;		# moment of Inertia
	set z0rig 0.0;
	set y0rig 0.0;
    set betaY 0.0;
    set betaZ 0.0;
    element elasticBeamColumn $EndLoad $EndNode $EndLoad $Arig $Es $Gs $Jrig $Iy $Iz $IDColTransf $y0rig $z0rig $betaY $betaZ;	

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/centroidDB40MassDens.out -time -node $EndLoad -dof 1 2 3 4 5 6 disp;			# displacements of end node
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
set WindSeriesA "Series -dt 0.05 -filePath WindForceA100.txt -factor 1";
#set WindSeriesA "Series -dt 0.0025 -filePath loadHistory.txt -factor 1";	# define acceleration vector from file (dt=0.01 is associated with the input file gm)
pattern Plain 3 $WindSeriesA -fact 1000 {
	load $EndLoad 0.0 -10.0 5.0 0.0 0.0 0.0;   
}
#recorder plot $dataDir/DFreeWind100.out Displ-X 1200 10 300 300 -columns 2 1; # a window to plot the nodal displacements versus time

#rayleigh 0. 0. 0. [expr 2*0.02/pow([eigen 1],0.5)];		# set damping based on first eigen mode

# create the analysis
# wipeAnalysis;					# clear previously-define analysis parameters
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 5000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25 ;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 2000 0.0005;

puts "Done!"