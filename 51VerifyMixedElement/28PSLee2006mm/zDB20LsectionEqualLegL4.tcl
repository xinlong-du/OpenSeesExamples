# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 9/30/2019
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
#source Lsection.tcl;            # fiber section
# define GEOMETRY ------------------------------------------------------------------
#Nodes, NodeNumber, xCoord, yCoord, zCoord
for {set i 1} {$i<22} {incr i 1} {
	node $i [expr -200.0+200.0*$i] 0 0;
}
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ     
set StartNode 1;
set MiddleNode 11;
set EndNode 21;
fix $StartNode 1 1 1 1 0 0;
fix $EndNode   0 1 1 0 0 0;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Fy 250.0;
	set Es 200000.0;		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
	set Biso 5e-13;
	set matID 1;
	uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
	# ELEMENT properties
	# beam-column sections: L0.064x0.0508x0.0032
	set y0 -17.37643054;
	set z0 0.00000000;
	#set oC 0.0;
	# assign torsional Stiffness for 3D Model
	set J 1074.79040000;
	set GJ [expr $Gs*$J];
	source zLsectionEqualLeg.tcl
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1 -jntOffset 0.0 -21.21320344 0.0 0.0 -21.21320344 0.0;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/zDB20LsectionEqualLegL4.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
#recorder Node -file $dataDir/DB20LsectionSimpDispL4M.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;
#recorder Node -file $dataDir/DB20LsectionSimpReacL4.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
set N 1.0;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $EndNode -$N 0 0 0 0 0; 
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 5000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
set Dincr -0.01; #-0.00002
#integrator LoadControl 0.0001
#integrator ArcLength 0.005 1.0; #arclength alpha
                               #Node,  dof, 1st incr, Jd, min,   max
integrator DisplacementControl $EndNode 1   $Dincr     1  $Dincr -0.01;
analysis Static	;# define type of analysis static or transient
analyze 8000;

puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
