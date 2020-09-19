#Flexural-Torsional Buckling of Channel column 
#---------------------------------------------------------------------------------------------
set systemTime [clock seconds] 
puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
set startTime [clock clicks -milliseconds];
# ----------------------------------------------------------------------------
wipe;				# clear opensees model
#source Csection.tcl;         # C section facing right
#source CsectionLipTurnUp.tcl;   #Asymmetric C section
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model
model basic -ndm 3 -ndf 6;	# 3 dimensions, 6 dof per node
set dir FlexuralTorsionalBuckling
file mkdir $dir;                # create data directory

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
node 22	4200	0	0
node 23	4400	0	0
node 24	4600	0	0
node 25	4800	0	0
node 26	5000	0	0
node 27	5200	0	0
node 28	5400	0	0
node 29	5600	0	0
node 30	5800	0	0
node 31	6000	0	0

# define BOUNDARY CONDITIONS (single point constraint)
#----------------------------------------------------------
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ
fix 1  0 1 1 1 0 0;
fix 16 1 0 0 0 0 0;  
fix 31 0 1 1 1 0 0;

#-------------------------------------------------------------
set startNode 1
set middleNode 16
set endNode 31

# material properties:
	set Es 200000.0;		# Steel Young's Modulus
	set nu 0.3;			# Poisson's ratio
	set Gs [expr $Es/2./[expr 1+$nu]];  	# Torsional stiffness Modulus
	# C section: C100x75x3.0
    set J 2367.84;
	set GJ [expr $Gs*$J];
	#set Cw 1260000000;
	set A 789.28;		# cross-sectional area
	set Iy 1340000;		# moment of Inertia
	set Iz 582000;		# moment of Inertia
	#set z0 -63.46;
	#set y0 0.0;
    #set oC 0.0;
    #set betaZ 0;
    #set betaY 155.81;
    
set BeamTransfTag 1;    # associate a tag to beam transformation  
geomTransf Corotational $BeamTransfTag 0 0 1;# define geometric transformation: performs a corotational geometric transformation of \
beam stiffness and resisting force from the basic system to the global-coordinate system

# Define ELEMENTS -------------------------------------------------------------
for {set i 1} {$i<$endNode} {incr i 1} {
set elemID $i
set nodeI $i
set nodeJ [expr $i+1]
element elasticBeamColumn $elemID $nodeI $nodeJ $A $Es $Gs $J $Iy $Iz $BeamTransfTag;	
} 

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define RECORDERS
#-------------------------------------------------------------
recorder Node -file $dir/ElasSimpUB_Nmid.out -time -node $middleNode -dof 1 2 3 4 5 6 disp;# record displacements at the middle node
recorder Node -file $dir/ElasSimpUB_Nsta.out -time -node $startNode -dof 1 2 3 4 5 6 disp;
# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
set N 1000.0;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $startNode $N 0 0 0 0 0;
  load $endNode -$N 0 0 0 0 0;
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 50 ; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
set Dincr 0.0001;#0.0001
#set Dmax 10
set IDctrlNode $startNode
set IDctrlDOF 1
#integrator LoadControl 0.01
#integrator ArcLength 0.05 1.0; #arclength alpha
integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;# Node number, dof number, 1st disp. increment
analysis Static	;# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];
set ok [analyze 20000];
#--------------------------------------------------------------------------------
set finishTime [clock clicks -milliseconds];
puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
set systemTime [clock seconds] 
puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"

