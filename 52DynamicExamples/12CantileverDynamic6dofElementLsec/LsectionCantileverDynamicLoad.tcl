# --------------------------------------------------------------------------------------------------
# DYNAMIC wind analysis -------------------------------------------------------------
#recorder Node -file $dataDir/DFreeWind100NR.out -time -node 119 128 -dof 3 disp;			# displacements of free node
#recorder Node -file $dataDir/RBaseWind100NR.out -time -node 93 66 34 4 -dof 3 reaction;		# support reaction
# create load pattern
set WindSeriesA "Series -dt 1 -filePath WindForceA100.txt -factor 10";	# define acceleration vector from file (dt=0.01 is associated with the input file gm)
#set WindSeriesB "Series -dt 1 -filePath windForce/WindForceB100.txt -factor 1";
#set WindSeriesD "Series -dt 1 -filePath windForce/WindForceD100.txt -factor 1";
#set WindSeriesF "Series -dt 1 -filePath windForce/WindForceF100.txt -factor 1";
pattern Plain 3 $WindSeriesA -fact 1 {
	load $EndNode  0.0 [expr 1.0*$lbf] [expr 1.0*$lbf] 0.0 0.0 0.0;
}

#recorder plot $dataDir/DFreeWind100.out Displ-X 1200 10 300 300 -columns 2 1; # a window to plot the nodal displacements versus time

rayleigh 0. 0. 0. [expr 2*0.02/pow([eigen 1],0.5)];		# set damping based on first eigen mode

# create the analysis
# wipeAnalysis;					# clear previously-define analysis parameters
constraints Plain;     				# how it handles boundary conditions
numberer Plain;					# renumber dof's to minimize band-width (optimization), if you want to
system BandGeneral;					# how to store and solve the system of equations in the analysis
test NormDispIncr 1.0e-8 50;				# determine if convergence has been achieved at the end of an iteration step
#algorithm Newton;					# use Newton's solution algorithm: updates tangent stiffness at every iteration
#integrator Newmark 0.5 0.25 ;			# determine the next time step for an analysis
algorithm Linear
integrator CentralDifference
analysis Transient;					# define type of analysis: time-dependent
analyze 34300000 0.00000001;					# Central Difference
#analyze 3438 1;

puts "Done!"


