# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
# --------------------------------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
# SET UP ----------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model

# Define  SECTIONS -------------------------------------------------------------
set ColSecTag 1
# define MATERIAL properties
set Es 70000.0;		# Steel Young's Modulus
set nu 0.33;
set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
set Fy 20.0;
set Biso 0.2;
set matID 1;
uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
# ELEMENT properties
set J 8424.0;
set GJ [expr $Gs*$J];
set y0 0.0;
set z0 -14.21;
source TSec.tcl;
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
#Nodes, NodeNumber, xCoord, yCoord, zCoord
for {set i 1} {$i<42} {incr i 1} {
	node $i [expr -45.0+45.0*$i] 0 0;
}
# ------ define boundary conditions 
fix 1  1 1 1 1 1 1;
fix 41  0 1 1 1 1 1;
for {set i 1} {$i<41} {incr i 1} {
	set elemID $i
	set nodeI $i
	set nodeJ [expr $i+1]
	element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0;	
} 
set F 10.0;  
pattern Plain 1 Linear {
	load 21 0 $F 0 0 0 0;
}
set P 10000.0; 
pattern Plain 2 Linear {
	load 41 -$P 0 0 0 0 0;
}

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/InElasDispEndDB40.out -time -node 41 -dof 1 2 3 4 5 6 disp;			# displacements of end node
recorder Node -file $dataDir/InElasDispMidDB40.out -time -node 21 -dof 1 2 3 4 5 6 disp;			# displacements of middle node
#recorder Node -file $dataDir/CantileverReac.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.01;
#integrator ArcLength 0.05 1.0; #arclength alpha
set Dincr -0.01; #-0.00002
                                #Node,  dof, 1st incr, Jd, min,   max
integrator DisplacementControl    41     1   $Dincr     1  $Dincr -0.01;
analysis Static	;# define type of analysis static or transient
analyze 2500;
puts "Finished"
#--------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"