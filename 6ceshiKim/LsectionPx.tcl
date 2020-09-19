# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load
# Xinlong Du, 4/4/2019
# nonlinearBeamColumn element, inelastic fiber section
#
# SET UP ----------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm=#dimension, ndf=#dofs
set dataDir Data;			# set up name of data directory
file mkdir $dataDir; 			# create data directory
source LibUnits.tcl;			# define units
source DisplayPlane.tcl;		# procedure for displaying a plane in model
source DisplayModel3D.tcl;		# procedure for displaying 3D perspectives of model
source Lsection.tcl;

# define GEOMETRY ------------------------------------------------------------------
# ------ define nodes
#Nodes, NodeNumber, xCoord, yCoord, zCoord
node 1 0 0 0;
node 2 118 0 0;
node 3 236 0 0;
# ------ define boundary conditions
# NodeID,dispX,dispY,dispZ,rotX,RotY,RotZ 
fix 1 0 1 1 1 0 0;    
fix 2 1 0 0 0 0 0;
fix 3 0 1 1 1 0 0;
# Set up parameters
set StartNode 1;
set MiddleNode 2;
set EndNode 3;
# Define  SECTIONS -------------------------------------------------------------
set SectionType FiberSection;		# options: Elastic FiberSection

# define section tags:
set ColSecTag 1
set ColSecTagFiber 4
set SecTagTorsion 70

if {$SectionType == "Elastic"} {
	# material properties:
	set Es [expr 29000*$ksi];		# Steel Young's Modulus
	set nu 0.3;			# Poisson's ratio
	set Gs [expr $Es/2./[expr 1+$nu]];  	# Torsional stiffness Modulus
	set J $Ubig;			# set large torsional stiffness
	# column sections: W27x114
	set AgCol [expr 33.5*pow($in,2)];		# cross-sectional area
	set IzCol [expr 4090.*pow($in,4)];		# moment of Inertia
	set IyCol [expr 159.*pow($in,4)];		# moment of Inertia
	
	section Elastic $ColSecTag $Es $AgCol $IzCol $IyCol $Gs $J

	set matIDhard 1;		# material numbers for recorder (this stressstrain recorder will be blank, as this is an elastic section)

} elseif {$SectionType == "FiberSection"} {
	# define MATERIAL properties 
	set Fy [expr 50.0*$ksi]
	set Es [expr 29000*$ksi];		# Steel Young's Modulus
	set nu 0.3;
	set Gs [expr $Es/2./[expr 1+$nu]];  # Torsional stiffness Modulus
	set Hiso 0
	set Hkin 1000
	set matIDhard 1
	uniaxialMaterial Hardening  $matIDhard $Es $Fy   $Hiso  $Hkin

	# ELEMENT properties
	# Structural-Steel W-section properties
	# column sections: L6x6x0.4375
	set a [expr 5*$in];	# leg length
	set b [expr 3.5*$in];	# leg length
	set t1 [expr 0.3125*$in];	# leg thickness
	set t2 [expr 0.3125*$in];	# leg thickness
	set nfa 10;		# number of fibers along a
	set nfb 10;		# number of fibers along b
	set nft1 3;		# number of fibers along t1
	set nft2 3;	    # number of fibers along t2
	Lsection  $ColSecTagFiber $matIDhard $a $b $t1 $t2 $nfa $nfb $nft1 $nft2
	
	# assign torsional Stiffness for 3D Model
	set J 0.0883
	set GJ [expr $Gs*$J]
	uniaxialMaterial Elastic $SecTagTorsion $GJ
	section Aggregator $ColSecTag $SecTagTorsion T -section $ColSecTagFiber
} else {
	puts "No section has been defined"
	return -1
}

# --------------------------------------------------------------------------------------------------------------------------------
# define ELEMENTS
# set up geometric transformations of element
#   consider P-Delta analysis
set IDColTransf 1; # all members
set ColTransfType Corotational;		# options for columns: Linear PDelta Corotational 
geomTransf $ColTransfType  $IDColTransf 0 0 1;	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
set numIntgrPts 5;	# number of Gauss integration points for nonlinear curvature distribution
element nonlinearBeamColumn 1 1 2 $numIntgrPts $ColSecTag $IDColTransf;
element nonlinearBeamColumn 2 2 3 $numIntgrPts $ColSecTag $IDColTransf;

# Define RECORDERS -------------------------------------------------------------
recorder Node -file $dataDir/Disp.out -time -node $EndNode -dof 1 2 3 4 5 6 disp;			# displacements of middle node
recorder Node -file $dataDir/Reac.out -time -node $MiddleNode -dof 1 2 3 4 5 6 reaction;		# support reaction

# Define DISPLAY -------------------------------------------------------------
DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# define second stage main Load (Axial force at the two ends)
#------------------------------------------------------------- 
set N 10.0;
pattern Plain 2 Linear {
  # NodeID, Fx, Fy, Fz, Mx, My, Mz
  load $StartNode $N 0 0 0 0 0;
  load $EndNode -$N 0 0 0 0 0; 
 }

# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints Plain; # how it handles boundary conditions
numberer Plain;	   # renumber dof's to minimize band-width 
system BandGeneral;# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-08 50 ; # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm Newton;
set Dincr 0.00001; #0.0001
#set Dmax 10;
set IDctrlNode $StartNode; # node where displacement is read for displacement control
set IDctrlDOF 1;            # degree of freedom of displacement read for displacement control
#integrator LoadControl 0.01
#integrator ArcLength 0.05 1.0; #arclength alpha
integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;# Node number, dof number, 1st disp. increment
analysis Static	;# define type of analysis static or transient
variable algorithmTypeStatic Newton
#set Nsteps [expr int($Dmax/$Dincr)];
set ok [analyze 2000];
puts "Finished"
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"