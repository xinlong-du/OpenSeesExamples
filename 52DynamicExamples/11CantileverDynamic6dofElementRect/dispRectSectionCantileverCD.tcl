# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load
# Xinlong Du, 4/5/2019
# nonlinearBeamColumn element, inelastic fiber section
#
# SET UP ----------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
source LibUnits.tcl;			# define units
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model

# define GEOMETRY ------------------------------------------------------------------
# ------ define nodes
#Nodes, NodeNumber, xCoord, yCoord, zCoord
node 1	0.00	0	0
node 2  1.84    0   0
node 3	3.68	0	0
node 4	5.52	0	0
node 5	7.36	0	0
node 6	9.2    	0	0
node 7	11.04	0	0
node 8	12.88	0	0
node 9	14.72	0	0
node 10	16.56	0	0
node 11	18.4	0	0
node 12	20.24	0	0
node 13	22.08	0	0
node 14	23.92	0	0
node 15	25.76	0	0
node 16	27.6	0	0
node 17	29.44	0	0
node 18	31.28	0	0
node 19	33.12	0	0
node 20	34.96	0	0
node 21	36.8	0	0
node 22	38.64	0	0
node 23	40.48	0	0
node 24	42.32	0	0
node 25	44.16	0	0
node 26	46.00  	0	0
node 27	47.84	0	0
node 28	49.68	0	0
node 29	51.52	0	0
node 30	53.36	0	0
node 31	55.2	0	0
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ 
fix 1  1 1 1 1 1 1;    
# Set up parameters
set StartNode 1;
set MiddleNode 16;
set EndNode 31;

# Define  SECTIONS -------------------------------------------------------------------

# define section tags:
set ColSecTag 1
set ColSecTagFiber 4
set SecTagTorsion 70

# define MATERIAL properties 
set Fy [expr 50.0*$ksi]
set Es [expr 29000.0*$ksi];		# Steel Young's Modulus
set nu 0.3;
set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
set Hiso 0
set Hkin 1000
set matIDhard 1
uniaxialMaterial Hardening $matIDhard $Es $Fy $Hiso $Hkin

# ELEMENT properties
# column sections: Rect2x2
#set wn 0.0; # assume sectorial coordinate of any fiber = 0
set y0 0.0;
set z0 0.0;
#set oC 0.0;
set J [expr 0.0270*$in4];
set GJ [expr $Gs*$J];

section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    fiber  0.5 -0.5 1.0 $matIDhard;
    fiber  0.5  0.5 1.0 $matIDhard;
    fiber -0.5 -0.5 1.0 $matIDhard;
    fiber -0.5  0.5 1.0 $matIDhard;
}

# --------------------------------------------------------------------------------------------------------------------------------
# define ELEMENTS
# set up geometric transformations of element
#   consider P-Delta analysis
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/NewDisp6dofCantileverDispCD.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
recorder Node -file $dataDir/NewDisp6dofCantileverReacCD.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# Define MASS
set Gravity [expr 0.02*$kip];
set Mass [expr $Gravity/$g]
mass $EndNode $Mass $Mass $Mass 0.0 0.0 0.0;

# define gravity load
#------------------------------------------------------------- 

pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $EndNode 0 $Gravity 0 0 0 0; 
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 50 ; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#set Dincr -0.0001; #0.0001
#set Dmax 10;
#set IDctrlNode $EndNode; # node where displacement is read for displacement control
#set IDctrlDOF 1;            # degree of freedom of displacement read for displacement control
integrator LoadControl 0.1
#integrator ArcLength 0.05 1.0; #arclength alpha
#integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;# Node number, dof number, 1st disp. increment
analysis Static	;# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];
set ok [analyze 10];
loadConst -time 0.0
puts "Modal Built"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
