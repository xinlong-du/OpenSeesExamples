# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
# Test of OpenSees Database commands and restart analysis
# Xinlong Du, 6/21/2021
# --------------------------------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
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
node 1	0.00	0	    0
node 2  48.0    0       0
node 3	96.0	0	    0
node 4	144.0	0	    0
node 5	192.0	0	    0
node 6	240.0   0	    0
# ------ define boundary conditions
fix 1 1 1 1 1 1 1;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 71240;		# Steel Young's Modulus
	set nu 0.31;
	set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
	set matID 1;
	uniaxialMaterial Elastic $matID $Es;
	# ELEMENT properties
	set J 2.16;
	set GJ [expr $Gs*$J];
	set y0 0.0;
	set z0 0.0;
source FiberSec.tcl;

# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<6} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf;	
} 

# define 1st ANALYSIS-------------------------------------------------------------------------------------------
recorder Node -file $dataDir/dispDB5stp1.out -time -node 6 -dof 1 2 3 4 5 6 disp;			# displacements of middle node

DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

set N 1.0;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load 6 0 0 $N 0 0 0; 
}

constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
integrator LoadControl 0.01
#integrator ArcLength 0.05 1.0; #arclength alpha
#set Dincr 0.005; #-0.00002
                                #Node,  dof, 1st incr, Jd, min,   max
#integrator DisplacementControl $EndNode 3   $Dincr     1  $Dincr 0.005;
analysis Static	;# define type of analysis static or transient
analyze 7500;
puts "Finished 1st analysis"

# CALL DATABASE----------------------------------------------------------------------------
set dbDir db;			      # set up name of data directory
file mkdir $dbDir; 			  # create data directory

database File db/DB5;
save 81;

wipe;

database File db/DB5;
restore 81;

# setTime 0;
# remove loadPattern 1;

# define 2nd ANALYSIS-------------------------------------------------------------------------------------------
recorder Node -file $dataDir/dispDB5stp2.out -time -node 6 -dof 1 2 3 4 5 6 disp;			# displacements of middle node

DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
integrator LoadControl 0.01
#integrator ArcLength 0.05 1.0; #arclength alpha
#set Dincr 0.005; #-0.00002
                                #Node,  dof, 1st incr, Jd, min,   max
#integrator DisplacementControl $EndNode 3   $Dincr     1  $Dincr 0.005;
analysis Static	;# define type of analysis static or transient
analyze 7500;
puts "Finished 2nd analysis"
#--------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"