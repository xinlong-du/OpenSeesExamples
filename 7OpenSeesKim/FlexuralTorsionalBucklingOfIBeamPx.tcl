# Torsional buckling of simply supported I beam 
#----------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
#---------------------------------------------------------------------------
wipe;		     # clear opensees model
source ISection.tcl; #loads file that creates section fiber

model basic -ndm 3 -ndf 7;		# 3 dimensions, 7 dof per node
set dir FlexuralTorsionalBuckling;      #name the directory
file mkdir $dir; 			# create data directory

# Define GEOMETRY -------------------------------------------------------------
# nodal coordinates:
#Node ID x, y, z coordinates
node 1	0	0	0
node 2	300	0	0
node 3	600	0	0
node 4	900	0	0
node 5	1200	0	0
node 6	1500	0	0
node 7	1800	0	0
node 8	2100	0	0
node 9	2400	0	0
node 10	2700	0	0
node 11	3000	0	0
node 12	3300	0	0
node 13	3600	0	0
node 14	3900	0	0
node 15	4200	0	0
node 16	4500	0	0
node 17	4800	0	0
node 18	5100	0	0
node 19	5400	0	0
node 20	5700	0	0
node 21	6000	0	0

# define BOUNDARY CONDITIONS (single point constraint)
#----------------------------------------------------------
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ, Warping  
fix 1 0 1 1 1 0 0 0;
fix 11 1 0 0 0 0 0 0;
fix 21 0 1 1 1 0 0 0;
#----------------------------------------------------------
set startNode 1
set middleNode 11
set endNode 21

# Define ELEMENTS & SECTIONS -------------------------------------------------------------
set ColSecTagFiber 1;			# assign a tag number to the column section
set SecTagTorsion 70
set ColSecTag 3
set BeamSecTag 4
 
# define MATERIALS
#----------------------------------------------------------------
set IDsteel 1;
set Fy 500000; # Use very large yield stress for elastic buckling analysis
set Es 200000.0;
set Bs 0.0075;			# strain-hardening ratio 
#set R0 15;
#set cR1 0.925;			# control the transition from elastic to plastic branches
#set cR2 0.15;			# control the transition from elastic to plastic branches
set poisson 0.3
set G [expr $Es/(2.0*(1+$poisson))];
uniaxialMaterial Steel01 $IDsteel $Fy $Es $Bs;	# build steel01 material

# define SECTION DIMENSION AND FIBER DIVISION
#----------------------------------------------------------------
set D 100.0;	# depth
set B 75.0;	# flange width
set tf 3.0;	# flange thickness
set tw 3.0;	# web thickness
set nfdw 50;	# number of fibers along dw
set nfbf 40;	# number of fibers along bf
set nft 1;
set beta 0.5;
set oC 0.0;		# sectorial coordinate at the centroid
# define FIBER SECTION, TORSION SECTION & TRANSFORMATION
#-----------------------------------------------------------------
set shearCoord [ISection $ColSecTagFiber $IDsteel $D $B $tf $tw $nfbf $nfdw $nft $beta];
set z0 [lindex $shearCoord 0 0];  #z-coord of shear center w.r.t centroid of section
set y0 [lindex $shearCoord 1 0];  #y-coord of shear center w.r.t centroid of section
set J  [lindex $shearCoord 2 0];  #Torsional constant
set GJ [expr $G*$J]
uniaxialMaterial Elastic $SecTagTorsion $GJ
section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber

# define geometric transformation: performs a corotational geometric transformation of beam stiffness and \
resisting force from the basic system to the global-coordinate system
set numIntgrPts 5;
set ColTransfTag 1;	# number of integration points along the element
geomTransf Corotational $ColTransfTag 0 0 1;  # associate a tag to column transformation

# Define ELEMENTS -------------------------------------------------------------
for {set i 1} {$i<$endNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $ColTransfTag $y0 $z0 $oC;	
} 

# define initial Perturbation Load
#------------------------------------------------------------- 
pattern Plain 1 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
  load $middleNode 0 0 1 0 0 0 0;#Fz=1 for flexural buckling; Mx=48.5 for torsional buckling
  }
constraints Plain;  # Constraint handler -how it handles boundary conditions
numberer Plain;	    # Renumbers DoF to minimize band-width (optimization)
system BandGeneral;	# System of equations solver
#test NormUnbalance 1.0e-10 20 1; # tol maxNumIter printFlag
test NormDispIncr 1.0e-8 50 0;
algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator LoadControl 1.0 ;
analysis Static; 
analyze 10; 

loadConst -time 0.0; # maintains the load constant for the reminder of the analysis and resets the current time to 0

# Define RECORDERS
#-------------------------------------------------------------
recorder Node -file $dir/IB_NxTor20.out -time -node $middleNode -dof 1 2 3 4 5 6 7 disp;

# define second stage main Load (Axial force at the two ends)
#-------------------------------------------------------------
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
  load $startNode 1000.0 0 0 0 0 0 0;
  load $endNode -1000.0 0 0 0 0 0 0;
}

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain;     			# how it handles boundary conditions
numberer Plain;				# renumber dof's to minimize band-width 
system BandGeneral;			# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 20 ; 		# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;
set Dincr 0.0001; 
#set Dmax 10
set IDctrlNode $middleNode
set IDctrlDOF 3;#3 for flexural mode; 4 for torsional mode
#integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;	# determine the time step for an analysis
integrator LoadControl 0.05 ; #0.1 for torsional buckling; 0.05 for flexural buckling 
analysis Static;				# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];		# number of analysis steps
set ok [analyze 2000];                		# this will return zero if no convergence problems were encountered
#--------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"



