# --------------------------------------------------------------------------------------------------
# Nonlinear dynamic analysis of a tee beam
# Xinlong Du, 9/25/2019
# dispBeamColumn element for Asymmetric sections
# Test of OpenSees Database commands and restart analysis
# Xinlong Du, 6/8/2021
# Modified for OpenSeesMP
# Xinlong Du, 6/15/2021
# SET UP -------------------------------------------------------------------------------------------
wipe;				# clear memory of all past model definitions
set pid [getPID]
set np [getNP]
if {$np != 2} {
    puts "ONLY WORKS FOR 2 PROCESSORS"
    exit
}
set dataDir Data;
set StartNode 1;
set MiddleNode 21;
set EndNode 41;
set StartCentroid 101;
set EndCentroid 141;
set EndLoad 201;

if {$pid == 0} {
wipe;

database File db/jobs2DB40pid0;
restore 81;

# setTime 0;
# remove loadPattern 1;

# define 2ND ANALYSIS----------------------------------------------------------------
recorder Node -file $dataDir/jobs2fact250DB40stp2.out.$pid -time -node $EndCentroid -dof 1 2 3 4 5 6 disp;
# DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# create the analysis
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 5000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 1000 0.001;
puts "jobs2: Done 2nd analysis of pid 0"
} elseif {$pid == 1} {
wipe;

database File db/jobs2DB40pid1;
restore 82;

# setTime 0;
# remove loadPattern 1;

# define 2ND ANALYSIS----------------------------------------------------------------
recorder Node -file $dataDir/jobs2fact1000DB40stp2.out.$pid -time -node $EndCentroid -dof 1 2 3 4 5 6 disp;
# DisplayModel3D DeformedShape;	 # options: DeformedShape NodeNumbers ModeShape

# create the analysis
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 5000;				# determine if convergence has been achieved at the end of an iteration step
algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
integrator Newmark 0.5 0.25;			# determine the next time step for an analysis
#algorithm Linear
#integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
#analyze 34300000 0.0000001;					# Central Difference
analyze 1000 0.001;
puts "jobs2: Done 2nd analysis of pid 1"
}

wipe;