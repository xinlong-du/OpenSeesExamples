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
for {set i 1} {$i<4} {incr i 1} {
	node $i [expr -131.27+131.27*$i] 0 0;
}
node 4 262.54 0.82 0;
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ   
set StartNode 1;
set MiddleNode 2;
set EndNode 3;
set EndLoad 4;
fix $StartNode 1 1 1 1 0 0;
fix $EndNode 0 1 1 0 0 0;
# Define  SECTIONS -------------------------------------------------------------
# define section tags:
set ColSecTag 1
	# define MATERIAL properties 
	set Es 29000;		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/(2*(1+$nu))];  # Torsional stiffness Modulus
	set Fy 50.0;
	set Biso 0.001;
	set matID 1;
	uniaxialMaterial Steel01 $matID $Fy $Es $Biso;
	# ELEMENT properties
	# beam-column sections: L5x3.5x5/16
	set J 0.536;
	set GJ [expr $Gs*$J];
	set y0 0.0;
	set z0 0.0;
	
source WSecCoarse.tcl;
	# assign torsional Stiffness for 3D Model
	#uniaxialMaterial Elastic $SecTagTorsion $GJ
	#section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 7;	# number of Gauss integration points for nonlinear curvature distribution
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumnAsym $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf -shearCenter $y0 $z0 -integration Lobatto;	
} 
element dispBeamColumnAsym 3 $EndNode $EndLoad $numIntgrPts $ColSecTag $IDColTransf -shearCenter $y0 $z0 -integration Lobatto;
# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/plasDB2End.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of end node
recorder Node -file $dataDir/plasDB2Mid.out -time -node $MiddleNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
recorder Element -file $dataDir/plasDB2DefoEle1sec1.out -time -ele 1 section 1 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec2.out -time -ele 1 section 2 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec3.out -time -ele 1 section 3 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec4.out -time -ele 1 section 4 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec5.out -time -ele 1 section 5 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec6.out -time -ele 1 section 6 deformation;
recorder Element -file $dataDir/plasDB2DefoEle1sec7.out -time -ele 1 section 7 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec1.out -time -ele 2 section 1 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec2.out -time -ele 2 section 2 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec3.out -time -ele 2 section 3 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec4.out -time -ele 2 section 4 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec5.out -time -ele 2 section 5 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec6.out -time -ele 2 section 6 deformation;
recorder Element -file $dataDir/plasDB2DefoEle2sec7.out -time -ele 2 section 7 deformation;
#recorder Node -file $dataDir/CantileverReac.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define initial Moment
#-------------------------------------------------------------
set P 449.6025; 
# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $EndLoad -$P 0 0 0 0 0; 
}

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.01;
set Dincr 0.0001; #-0.00002
#integrator ArcLength 0.05 1.0; #arclength alpha
                                #Node,  dof, 1st incr, Jd, min,   max
integrator DisplacementControl $EndNode 6   $Dincr     1  $Dincr 0.0001;
analysis Static;# define type of analysis static or transient
analyze 400;
puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
