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
for {set i 1} {$i<5} {incr i 1} {
	node $i [expr -179.76123+179.76123*$i] 0 0;
}
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ
set StartNode 1;
set MiddleNode 2;
set EndNode 4;
fix $StartNode  0 1 1 1 0 0;
#fix $MiddleNode 1 0 0 0 0 0;
fix $EndNode    1 1 1 1 0 0;    

# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 200000;		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
	set Fy 312;
	set Biso 5e-13;
	set matID 1000;
	uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
	uniaxialMaterial InitStressMaterial 1 $matID [expr -0.3*$Fy];
	uniaxialMaterial InitStressMaterial 2 $matID [expr -0.2*$Fy];
	uniaxialMaterial InitStressMaterial 3 $matID [expr -0.1*$Fy];
	uniaxialMaterial InitStressMaterial 4 $matID [expr 0.0*$Fy];
	uniaxialMaterial InitStressMaterial 5 $matID [expr 0.1*$Fy];
	uniaxialMaterial InitStressMaterial 6 $matID [expr 0.2*$Fy];
	uniaxialMaterial InitStressMaterial 7 $matID [expr 0.3*$Fy];
	uniaxialMaterial InitStressMaterial 8 $matID [expr 0.2*$Fy];
	uniaxialMaterial InitStressMaterial 9 $matID [expr 0.1*$Fy];
	uniaxialMaterial InitStressMaterial 10 $matID [expr 0.0*$Fy];
	uniaxialMaterial InitStressMaterial 11 $matID [expr -0.1*$Fy];
	uniaxialMaterial InitStressMaterial 12 $matID [expr -0.2*$Fy];
	uniaxialMaterial InitStressMaterial 13 $matID [expr -0.3*$Fy];
	uniaxialMaterial InitStressMaterial 14 $matID [expr -0.2*$Fy];
	uniaxialMaterial InitStressMaterial 15 $matID [expr -0.1*$Fy];
	uniaxialMaterial InitStressMaterial 16 $matID [expr 0.0*$Fy];
	uniaxialMaterial InitStressMaterial 17 $matID [expr 0.1*$Fy];
	uniaxialMaterial InitStressMaterial 18 $matID [expr 0.2*$Fy];
	uniaxialMaterial InitStressMaterial 19 $matID [expr 0.3*$Fy];
	uniaxialMaterial InitStressMaterial 20 $matID [expr 0.2*$Fy];
	uniaxialMaterial InitStressMaterial 21 $matID [expr 0.1*$Fy];
	uniaxialMaterial InitStressMaterial 22 $matID [expr 0.0*$Fy];
	uniaxialMaterial InitStressMaterial 23 $matID [expr -0.1*$Fy];
	uniaxialMaterial InitStressMaterial 24 $matID [expr -0.2*$Fy];
	uniaxialMaterial InitStressMaterial 25 $matID [expr -0.3*$Fy];
	# ELEMENT properties
	# beam-column sections: L0.064x0.0508x0.0032
	set y0 -17.85046440;
	set z0 16.21316644;
	# assign torsional Stiffness for 3D Model
	set J 5083.33333333;
	set GJ [expr $Gs*$J];
	source Lsection.tcl;
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 2;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element mixedBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf -shearCenter $y0 $z0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/mixedL76x51x5InElasLambda06EndMB3IntPt2.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
recorder Node -file $dataDir/mixedL76x51x5InElasLambda06SatMB3IntPt2.out -time -node $StartNode -dof 1 2 3 4 5 6 disp;		# support reaction
recorder Node -file $dataDir/mixedL76x51x5InElasLambda06MidMB3IntPt2.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;
# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
set N 190320;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $StartNode  $N 0 0 0 0 0;
  load $EndNode   -$N 0 0 0 0 0;
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 2000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.001
#integrator ArcLength 0.005 1.0; #arclength alpha
set Dincr 0.0002; #-0.00002
                               #Node,  dof, 1st incr, Jd, min,   max
#integrator DisplacementControl $MiddleNode 4   $Dincr     1  $Dincr 0.0001;
integrator DisplacementControl $StartNode 1   $Dincr     1  $Dincr 0.0002;
analysis Static	;# define type of analysis static or transient
analyze 7000;
puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
