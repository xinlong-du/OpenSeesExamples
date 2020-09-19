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
	node $i [expr -4.531367+4.531367*$i] 0 0;
}
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ
set StartNode 1;
set MiddleNode 11;
set EndNode 21;
fix $StartNode  0 1 1 1 0 0;
fix $MiddleNode 1 0 0 0 0 0;
fix $EndNode    0 1 1 1 0 0;    

# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 29000.0;		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
	set Fy 45.10;
	set Biso 0.032;
	set matID 1000;
	uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
	uniaxialMaterial InitStressMaterial 1 $matID -9.0;
	uniaxialMaterial InitStressMaterial 2 $matID -12.0;
	uniaxialMaterial InitStressMaterial 3 $matID -3.0;
	uniaxialMaterial InitStressMaterial 4 $matID 8.5;
	uniaxialMaterial InitStressMaterial 5 $matID 9.0;
	uniaxialMaterial InitStressMaterial 6 $matID 7.0;
	uniaxialMaterial InitStressMaterial 7 $matID 7.0;
	uniaxialMaterial InitStressMaterial 8 $matID 7.0;
	uniaxialMaterial InitStressMaterial 9 $matID 1.0;
	uniaxialMaterial InitStressMaterial 10 $matID -4.5;
	uniaxialMaterial InitStressMaterial 11 $matID -6.0;
	uniaxialMaterial InitStressMaterial 12 $matID -7.5;
	uniaxialMaterial InitStressMaterial 13 $matID -10.5;
	uniaxialMaterial InitStressMaterial 14 $matID -1.8;
	uniaxialMaterial InitStressMaterial 15 $matID -1.0;
	uniaxialMaterial InitStressMaterial 16 $matID 0.0;
	uniaxialMaterial InitStressMaterial 17 $matID 10.6;
	uniaxialMaterial InitStressMaterial 18 $matID 15.2;
	uniaxialMaterial InitStressMaterial 19 $matID 8.7;
	uniaxialMaterial InitStressMaterial 20 $matID 0.5;
	uniaxialMaterial InitStressMaterial 21 $matID -3.6;
	uniaxialMaterial InitStressMaterial 22 $matID -7.3;
	uniaxialMaterial InitStressMaterial 23 $matID -8.2;
	uniaxialMaterial InitStressMaterial 24 $matID -9.1;
	uniaxialMaterial InitStressMaterial 25 $matID -10.0;

	# ELEMENT properties
	# beam-column sections: L0.064x0.0508x0.0032
	set y0 -1.00427504;
	set z0 1.24801559;
	# assign torsional Stiffness for 3D Model
	set J 0.13403320;
	set GJ [expr $Gs*$J];
	source LsectionIniStre.tcl;
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
element mixedBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf -shearCenter $y0 $z0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/L5x3LonDB20IniStreEndReal5.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
recorder Node -file $dataDir/L5x3LonDB20IniStreSatReal5.out -time -node $StartNode -dof 1 2 3 4 5 6 disp;		# support reaction
recorder Node -file $dataDir/L5x3LonDB20IniStreMidReal5.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;
# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape
if 0 {
# define initial Moment
#-------------------------------------------------------------
set F -0.01; 
pattern Plain 1 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $MiddleNode 0 0 0 $F 0 0;
  }
constraints Plain;  # Constraint handler -how it handles boundary conditions
numberer Plain;	    # Renumbers DoF to minimize band-width (optimization)
system BandGeneral; # System of equations solver
#test NormUnbalance 1.0e-10 20 1; # tol maxNumIter printFlag
test NormDispIncr 1.0e-8 50 0;
algorithm Newton;# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator LoadControl 0.1;
analysis Static; 
analyze 10; 

loadConst -time 0.0; # maintains the load constant for the reminder of the analysis and resets the current time to 0
}

# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
set N 1.0;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $StartNode  $N 0 0 0 [expr -$N*$z0] [expr $N*$y0];
  load $EndNode   -$N 0 0 0 [expr $N*$z0]  [expr -$N*$y0];
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 5000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.001;
#integrator ArcLength 0.005 1.0; #arclength alpha
set Dincr -0.0001; #-0.00002
                               #Node,  dof, 1st incr, Jd, min,   max
#integrator DisplacementControl $MiddleNode 4   $Dincr     1  $Dincr -0.00001;
integrator DisplacementControl $EndNode 1   $Dincr     1  $Dincr -0.0001;
analysis Static;# define type of analysis static or transient
analyze 2000;
puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
