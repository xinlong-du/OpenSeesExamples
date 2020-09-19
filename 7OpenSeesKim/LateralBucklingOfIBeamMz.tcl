# Lateral buckling of simply supported C beam subjected to pure bending
# ----------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
#---------------------------------------------------------------------------
wipe; # clear opensees model
source ISection.tcl; # I-section
model basic -ndm 3 -ndf 7;# 3 dimensions, 7 dof per node
set dir LateralBuckling;#set dir lateral buckling of C section
file mkdir $dir; # create data directory

# define GEOMETRY
#-------------------------------------------------------------
#Nodes, NodeNumber, xCoord, yCoord, zCoord
node 1	0	0	0
node 2	200	0	0
node 3	400	0	0
node 4	600	0	0
node 5	800	0	0
node 6	1000	0	0
node 7	1200	0	0
node 8	1400	0	0
node 9	1600	0	0
node 10	1800	0	0
node 11	2000	0	0
node 12	2200	0	0
node 13	2400	0	0
node 14	2600	0	0
node 15	2800	0	0
node 16	3000	0	0
node 17	3200	0	0
node 18	3400	0	0
node 19	3600	0	0
node 20	3800	0	0
node 21	4000	0	0

# define BOUNDARY CONDITIONS (single point constraint)
#----------------------------------------------------------
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ, Warping 
fix 1 0 1 1 1 0 0 0;
fix 11 1 0 0 0 0 0 0;
fix 21 0 1 1 1 0 0 0; 			
#----------------------------------------------------
set startNode 1
set middleNode 11
set endNode 21
# Define ELEMENTS & SECTIONS
#-------------------------------------------------------------
set BeamSecTagFiber 1;# assign a tag number to the column section
set SecTagTorsion 70;# assign a tag number for torsion 
set BeamSecTag 3
 
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
set tw 3.0;		# web thickness for I-section
set tf 3.0;		# Flange thickness for I-section	
set nfdw 50;		# number of fibers along web depth
set nfbf 40;		# number of fibers along flange
set nft 1;		# number of fibers through thickness
set beta 0.5; 		#factor to determine web stem location (0.0<=beta<=1.0; 0=left end; 1=right end; 0.5=middle of flange)
set oC 0.0;		# sectorial coordinate at the centroid

# define FIBER SECTION, TORSION SECTION & TRANSFORMATION
#-----------------------------------------------------------------
set shearCoord [ISection $BeamSecTagFiber $IDsteel $D $B $tf $tw $nfbf $nfdw $nft $beta];
set z0 [lindex $shearCoord 0 0];  #z-coord of shear center w.r.t centroid of section
set y0 [lindex $shearCoord 1 0];  #y-coord of shear center w.r.t centroid of section
set J  [lindex $shearCoord 2 0];  #Torsional constant
set GJ [expr $G*$J];
uniaxialMaterial Elastic $SecTagTorsion $GJ ; # create torsion section
section Aggregator $BeamSecTag $SecTagTorsion T -section $BeamSecTagFiber ;

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
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $BeamSecTag $BeamTransfTag $y0 $z0 $oC;	
} 

# define initial Perturbation Load
#------------------------------------------------------------- 
pattern Plain 1 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
  load $middleNode 0 0 0 97.0 0 0 0; 
  }
constraints Plain;  # Constraint handler -how it handles boundary conditions
numberer Plain;	    # Renumbers DoF to minimize band-width (optimization)
system BandGeneral;# System of equations solver
#test NormUnbalance 1.0e-10 20 1; # tol maxNumIter printFlag
test NormDispIncr 1.0e-8 50 0;
algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator LoadControl 1.0 ;
analysis Static; 
analyze 10; 

loadConst -time 0.0; # maintains the load constant for the reminder of the analysis and resets the current time to 0

# define RECORDERS
#-------------------------------------------------------------
recorder Node -file $dir/IB_Mz20.out -time -node $middleNode -dof 1 2 3 4 5 6 7 disp;

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
set Dincr 0.0035;#-0.05;  #Displacement increment
#set Dmax 10
set IDctrlNode $middleNode
set IDctrlDOF 4

integrator LoadControl 0.005;
#integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr; 
analysis Static	;			# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];	# number of analysis steps

set ok [analyze 3000];    	        # this will return zero if no convergence problems were encountered
#-------------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"




