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
node 1 0.0    0.0    0.0;
node 2 0.0    600.0  0.0;
node 3 0.0    1200.0 0.0;
node 4 240.0  1200.0 0.0;
node 5 720.0  1200.0 0.0;
node 6 1200.0 1200.0 0.0;
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNode 4;
set EndNode 6;
fix $StartNode 1 1 1 0 0 0;
fix $EndNode   1 1 1 0 0 0;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 70608.0;		# Steel Young's Modulus
	set Gs 27156.9;  # Torsional stiffness Modulus, nu=0.3
	set Fy 1020.0;
	set Biso 0.1;
	set matID 1;
	uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
	# ELEMENT properties
	# beam-column sections: L5x3.5x5/16
	set J 47040.0;
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
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/LeeFrameInElasDB5.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
#recorder Node -file $dataDir/CantileverReac.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define second stage main Load (Axial force at the two ends)
#-------------------------------------------------------------
set P 1000.0;
pattern Plain 2 Linear {
  #    NodeID,     Fx, Fy, Fz, Mx, My, Mz
  load $MiddleNode 0.0 -$P 0.0 0.0 0.0 0.0; 
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.1;
#integrator ArcLength 1.0 0.15; #arclength alpha
set Dincr -1.0; #-0.00002
                               #Node,     dof, 1st incr, Jd, min,   max
integrator DisplacementControl $MiddleNode 2   $Dincr     1  $Dincr -1.0;
analysis Static	;# define type of analysis static or transient
analyze 1000;
puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
