# Cantilever C-beam with torque acting at the free end
# ----------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
#---------------------------------------------------------------------------
wipe; # clear opensees model
source Csection.tcl; # C-section with round corners
model basic -ndm 3 -ndf 7;# 3 dimensions, 7 dof per node

set dir LateralBuckling;#set dir lateral buckling of C section;
file mkdir $dir; # create data directory

# define GEOMETRY -------------------------------------------------------------
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

# Single point constraints -- Boundary Conditions
#----------------------------------------------------------------------
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ, Warping 
fix 1 1 1 1 1 1 1 0;

# Define ELEMENTS & SECTIONS
#-------------------------------------------------------------
set ColSecTagFiber 1;	# assign a tag number to the column section
set SecTagTorsion 70
set ColSecTag 3
 
# define material
#------------------------------------------------------------
set IDsteel 1;
#set Fy 450.0;  # Use actual yield stress for the inelastic buckling analysis
set Fy 500000.0; # Use very large yield stress for elastic buckling analysis
set Es 200000.0;
set Bs 0.0075;		# strain-hardening ratio 
#set R0 15;		# 10<R0<20
#set cR1 0.925;		# control the transition from elastic to plastic branches
#set cR2 0.15;		# control the transition from elastic to plastic branches
set G [expr $Es/(2*(1+0.3))];
uniaxialMaterial Steel01 $IDsteel $Fy $Es $Bs;	# build steel01 material

# define SECTION DIMENSION AND FIBER DIVISION
#----------------------------------------------------------------
set B 75.0; 		#Flange width
set D 100.0;		# depth
set L 16.5;		# Lip
set t 1.5;		# section thickness for C-section
set r 3.0;		# corner radius (to inside face)
set nfdw 50;		# number of fibers along web depth
set nfbf 40;		# number of fibers along flange
set nfL 10;		# number of fibers along lip
set nfC 4;		# number of fibers along circumferance of corners
set nft 1;              # number of fiber through the thickness(=1 as section is thin)
set oC 0.0;             # sectorial coordinate at the centroid
#
# define FIBER SECTION, TORSION SECTION & TRANSFORMATION
#-----------------------------------------------------------------
set shearCoord [Csection $ColSecTagFiber $IDsteel $D $B $L $t $r $nfdw $nfbf $nfL $nfC $nft];
set z0 [lindex $shearCoord 0 0];  #z-coord of shear center w.r.t centroid of section
set y0 [lindex $shearCoord 1 0];  #y-coord of shear center w.r.t centroid of section
set J  [lindex $shearCoord 2 0];  #Torsional constant
set GJ [expr $G*$J];
uniaxialMaterial Elastic $SecTagTorsion $GJ
section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber

set numIntgrPts 5; # number of integration points along each element
set ColTransfTag 1;# associate a tag to beam transformation			   
geomTransf Corotational $ColTransfTag 0 0 1;# define geometric transformation: performs a corotational geometric \
#transformation of beam stiffness and resisting force from the basic system to the global-coordinate system

# Define ELEMENTS -------------------------------------------------------------
for {set i 1} {$i<16} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element dispBeamColumn $elemID $nodeI $nodeJ $numIntgrPts $ColSecTag $ColTransfTag $y0 $z0 $oC;	
} 

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dir/TorD15.out -time -node 16 -dof 1 2 3 4 disp;

# define Torque
#------------------------------------------------------------- 
pattern Plain 1 Linear {
   # NodeID, Fx, Fy, Fz, Mx, My, Mz, Bx
   load 16 0 0 0 1000000.0 0 0 0; #Mz
}
#
# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain;     	# Constraint handler
numberer Plain;		# renumber dof's to minimize band-width 
system BandGeneral;	# method of solving the system of equations in the analysis
test NormDispIncr 1.0e-8 50; # determine if convergence has been achieved at the end of an iteration step

algorithm Newton;
set Dincr 0.001;
set IDctrlNode 16
set IDctrlDOF 4

integrator LoadControl 0.001;
#integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr; # determine the time step for an analysis

analysis Static	;			# define type of analysis static or transient
variable algorithmTypeStatic Newton
set ok [analyze 500];   
#-------------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"





