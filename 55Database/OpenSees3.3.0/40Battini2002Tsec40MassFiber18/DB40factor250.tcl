# --------------------------------------------------------------------------------------------------
# Nonlinear dynamic analysis of a tee beam
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
# Test of OpenSees Database commands and restart analysis
# Xinlong Du, 6/8/2021
# SET UP -------------------------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model
# define GEOMETRY ----------------------------------------------------------------------------------
#Nodes, NodeNumber, xCoord, yCoord, zCoord
for {set i 1} {$i<42} {incr i 1} {
	node $i [expr -0.125+0.125*$i] 0.0 0.0;
}
for {set i 101} {$i<142} {incr i 1} {
	node $i [expr -0.125+0.125*($i-100)] -0.047368 0.0;
}
node 201 5.0 0.01 0.0;
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNode 21;
set EndNode 41;
set StartCentroid 101;
set EndCentroid 141;
set EndLoad 201;
fix $StartCentroid 1 1 1 1 1 1;

# Define  SECTIONS --------------------------------------------------------------------------------
set ColSecTag 1;
# define MATERIAL properties 
set Es 210e9;		# Steel Young's Modulus
set nu 0.33;
set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
set matID 1;
uniaxialMaterial Elastic $matID $Es;

set J 1.04e-6;
set GJ [expr $Gs*$J];
set y0 0.047368;
set z0 0.0;
	
source TSecBattini.tcl;

# define ELEMENTS----------------------------------------------------------------------------------
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;

set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumnAsym $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf -shearCenter $y0 $z0;	
}

#set up rigid offsets
set Jrig 5.2e-4; 
set Arig 0.038;		# cross-sectional area
set Iz 1.5e-4;		# moment of Inertia
set Iy 1.5e-4;		# moment of Inertia
for {set i 101} {$i<[expr $EndCentroid+1]} {incr i 1} {
set elemID $i;
set nodeI [expr $i-100];
set nodeJ $i;
     element elasticBeamColumn $elemID $nodeI $nodeJ $Arig $Es $Gs $Jrig $Iy $Iz $IDColTransf;	
}
element elasticBeamColumn $EndLoad $EndNode $EndLoad $Arig $Es $Gs $Jrig $Iy $Iz $IDColTransf;
#set up mass
mass $StartCentroid 3.72875 3.72875 3.72875 0.0 0.0 0.0;
  mass $EndCentroid 3.72875 3.72875 3.72875 0.0 0.0 0.0;
for {set i [expr $StartCentroid+1]} {$i<$EndCentroid} {incr i 1} {
mass $i 7.4575 7.4575 7.4575 0.0 0.0 0.0;	
}

# Define RECORDERS ------------------------------------------------------------------
recorder Node -file $dataDir/fact250DB40stp1.out -time -node $EndCentroid -dof 1 2 3 4 5 6 disp;

# Define DISPLAY --------------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define 1ST ANALYSIS----------------------------------------------------------------
# create load pattern
set WindSeriesA "Series -dt 0.05 -filePath WindForceA100.txt -factor 1";
pattern Plain 3 $WindSeriesA -fact 250.0 {
	load $EndLoad  0.0 -50.0 25.0 0.0 0.0 0.0;  
}

# create the analysis
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 5000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 1000 0.001;
puts "Done 1st analysis"

# CALL DATABASE----------------------------------------------------------------------------
set dbDir db;			      # set up name of data directory
file mkdir $dbDir; 			  # create data directory

database File db/DB40;
save 71;

wipe;

database File db/DB40;
restore 71;

# setTime 0;
# remove loadPattern 1;

# define 2ND ANALYSIS----------------------------------------------------------------
recorder Node -file $dataDir/fact250DB40stp2.out -time -node $EndCentroid -dof 1 2 3 4 5 6 disp;
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# create the analysis
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 5000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 1000 0.001;
puts "Done 2nd analysis"

wipe
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"