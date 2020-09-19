# Lateral buckling of simply supported C beam subjected to major axis bending
# ----------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
#---------------------------------------------------------------------------
wipe; # clear opensees model
#source Csection.tcl;   # C-section with round corners
source CsectionLipTurnUp.tcl;#Asymmetric C section
model basic -ndm 3 -ndf 7;# 3 dimensions, 7 dof per node
set dir LateralBuckling;  #set dir lateral buckling of C section
file mkdir $dir;          # create data directory

# define GEOMETRY
#-------------------------------------------------------------
#Nodes, NodeNumber, xCoord, yCoord, zCoord
node 1	0	0	0
node 2	400	0	0
node 3	800	0	0
node 4	1200	0	0
node 5	1600	0	0
node 6	2000	0	0
node 7	2400	0	0
node 8	2800	0	0
node 9	3200	0	0
node 10	3600	0	0
node 11	4000	0	0

# define BOUNDARY CONDITIONS (single point constraint)
#----------------------------------------------------------
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ, Warping 
fix 1 0 1 1 1 0 0 0;
fix 6 1 0 0 0 0 0 0;
fix 11 0 1 1 1 0 0 0; 			
#-------------------------------------------------------
set startNode 1
set middleNode 6
set endNode 11

# Define ELEMENTS & SECTIONS
#-------------------------------------------------------------
set ColSecTagFiber 1;# assign a tag number to the column section
set SecTagTorsion 70;# assign a tag number for torsion 
set ColSecTag 3
 
# define MATERIALS
#----------------------------------------------------------------
set IDsteel 1; # Identifier for material
set Fy 500000.0; # Yield stress -Use very large yield stress for elastic buckling analysis
set Es 200000.0; # Elastic modulus
set Bs 0.0075;		# strain-hardening ratio 
#set R0 15;		# 10<R0<20
#set cR1 0.925;		# control the transition from elastic to plastic branches
#set cR2 0.15;		# control the transition from elastic to plastic branches
set G [expr $Es/(2*(1+0.3))]; # Shear modulus
uniaxialMaterial Steel01 $IDsteel $Fy $Es $Bs;	# build steel01 material

# define SECTION DIMENSION AND FIBER DIVISION
#----------------------------------------------------------------
set D 100.0;		# Depth
set B 75.0; 		# Flange width
set L 16.5;		# Lip
set t 3.0;		# section thickness for C-section	
set r 3.0;		# corner radius (to inside face)
set nfdw 50;		# number of fibers along web depth
set nfbf 40;		# number of fibers along flange
set nfL 10;		# number of fibers along lip
set nfC 4;		# number of fibers along circumferance of corners
set nft 1;		# number of fibers through thickness
set oC 0.0;		# sectorial coordinate at the centroid

# define FIBER SECTION, TORSION SECTION & TRANSFORMATION
#-----------------------------------------------------------------
#set shearCoord [Csection $ColSecTagFiber $IDsteel $D $B $L $t $r $nfdw $nfbf $nfL $nfC $nft];
set shearCoord [CsectionLipTurnUp $ColSecTagFiber $IDsteel $D $B $L $t $r $nfdw $nfbf $nfL $nfC $nft];
set z0 [lindex $shearCoord 0 0];  #z-coord of shear center w.r.t centroid of section
set y0 [lindex $shearCoord 1 0];  #y-coord of shear center w.r.t centroid of section
set J  [lindex $shearCoord 2 0];  #Torsional constant
set GJ [expr $G*$J];
uniaxialMaterial Elastic $SecTagTorsion $GJ ; # create torsion section
section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber ;

set numIntgrPts 5; # number of integration points along each element
set BeamTransfTag 1;# associate a tag to column transformation			   
geomTransf Corotational $BeamTransfTag 0 0 1;# define geometric transformation: performs a corotational geometric
#transformation of beam stiffness and resisting force from the basic system to the global-coordinate system

# Define ELEMENTS
#-------------------------------------------------------------
for {set i 1} {$i<$endNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $BeamTransfTag $y0 $z0 $oC;	
} 

# define initial Perturbation Load
#------------------------------------------------------------- 
pattern Plain 1 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
  load $middleNode 0 0 0 242.5 0 0 0;#+242.5 for positive branch;  
  }

constraints Plain;  # Constraint handler -how it handles boundary conditions
numberer Plain;	    # Renumbers DoF to minimize band-width (optimization)
system BandGeneral; # System of equations solver
#test NormUnbalance 1.0e-10 20 1; # tol maxNumIter printFlag
test NormDispIncr 1.0e-8 50;
algorithm NewtonLineSearch 0.6;# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator LoadControl 1.0 ;
analysis Static; 
analyze 10; 

loadConst -time 0.0; # maintains the load constant for the reminder of the analysis and resets the current time to 0

# define RECORDERS
#-------------------------------------------------------------
recorder Node -file $dir/AsyCB_Mz10P.out -time -node $middleNode -dof 1 2 3 4 5 6 7 disp;

# define second stage main Load (Moment at the two ends)
#------------------------------------------------------------- 
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
  load $startNode 0 0 0 0 0 -1000000.0 0;
  load $endNode 0 0 0 0 0 1000000.0 0;
}
# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain;           # how it handles boundary conditions
numberer Plain;		     # renumber dof's to minimize band-width 
system BandGeneral;	     # how to store and solve the system of equations in the analysis
#test NormUnbalance 1.0e-10 20 1;
test NormDispIncr 1.0e-8 50 0; # determine if convergence has been achieved at the end of an iteration step
algorithm NewtonLineSearch 0.8;
set Dincr -0.05;#0.0002; #-0.05; #Displacement increment/decrement 
#set Dmax 10
set IDctrlNode $middleNode
set IDctrlDOF 2;

integrator LoadControl 0.01;
#integrator ArcLength 0.025 1.0; #Use this for curve with peak
#integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr; 
analysis Static	;			# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];	# number of analysis steps

set ok [analyze 2000]; # use 6000 for negative branch
#-----------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"





