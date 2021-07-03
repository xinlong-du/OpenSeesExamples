# -----------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
# Test of OpenSees Database commands and restart analysis
# Xinlong Du, 6/4/2021
# -----------------------------------------------------------------------------------
# set systemTime [clock seconds] 
# puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
# set startTime [clock clicks -milliseconds];

# DEFINE MODEL-----------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			      # set up name of data directory
file mkdir $dataDir; 			  # create data directory
source LibUnits.tcl;			  # define units

#Nodes, NodeNumber, xCoord, yCoord, zCoord
for {set i 1} {$i<8} {incr i 1} {
	node $i [expr -9.2+9.2*$i] 0 0;
}

# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ 
fix 1  1 1 1 1 1 1;    
set StartNode 1;
set EndNode 7;
 
set Es [expr 27910*$ksi];		# Steel Young's Modulus
set nu 0.3;
set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
set matID 1
uniaxialMaterial Elastic $matID $Es;

set J [expr  0.02473958*$in4]
set GJ [expr $Gs*$J]
set z0 [expr 0.64625474*$in];
set y0 [expr -0.68720012*$in];
set ColSecTag 1; # define section tags
source L3x2x0_25.tcl;

set IDColTransf 1;
set ColTransfType Corotational;		              # options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	# define geometric transformation

set numIntgrPts 2;	# number of Gauss integration points
for {set i 1} {$i<$EndNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $IDColTransf $y0 $z0;	
} 

# DO 1ST ANALYSIS-------------------------------------------------------------------------- 
recorder Node -file $dataDir/Disp1.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			
recorder Node -file $dataDir/Reac1.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;

set N 5.0;
timeSeries Trig 1 0.0 1.0 1.0; # create TimeSeries
pattern Plain 1 1 {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $EndNode -$N 0 0 0 0 0;
}

constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
integrator LoadControl 0.0002;
#integrator ArcLength 0.05 1.0; #arclength alpha
#set Dincr -0.01; #-0.00002
                               #Node,  dof, 1st incr, Jd, min,   max
#integrator DisplacementControl $EndNode 1   $Dincr     1  $Dincr -0.01;
analysis Static	;# define type of analysis static or transient
analyze 5000;
puts "Finished 1st analysis"

# CALL DATABASE----------------------------------------------------------------------------
set dbDir db;			      # set up name of data directory
file mkdir $dbDir; 			  # create data directory

database File db/LsecDB;
save 76;

wipe;

database File db/LsecDB;
restore 76;

setTime 0;
remove loadPattern 1;

# DO 2ND ANALYSIS--------------------------------------------------------------------------
recorder Node -file $dataDir/Disp2.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			
recorder Node -file $dataDir/Reac2.out -time -node $StartNode -dof 1 2 3 4 5 6 reaction;

timeSeries Linear 2; # create TimeSeries
set N2 15;
pattern Plain 2 2 {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $EndNode -$N2 0 0 0 0 0;
}

constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 1000; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
#integrator LoadControl 0.0002;
#integrator ArcLength 0.05 1.0; #arclength alpha
set Dincr -0.01; #-0.00002
                               #Node,  dof, 1st incr, Jd, min,   max
integrator DisplacementControl $EndNode 1   $Dincr     1  $Dincr -0.01;
analysis Static	;# define type of analysis static or transient
analyze 7000;
puts "Finished 2nd analysis"
#--------------------------------------------------------------------------------
# set finishTime [clock clicks -milliseconds];
# puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
# set systemTime [clock seconds] 
# puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"