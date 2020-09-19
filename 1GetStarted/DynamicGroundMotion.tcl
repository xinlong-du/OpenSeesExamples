wipe
model basic -ndm 2 -ndf 3
#nodal coordinates:
node 1 0 0
node 2 504 0
node 3 0 432
node 4 504 432
#boundary conditions:
fix 1 1 1 1
fix 2 1 1 1
fix 3 0 0 0
fix 4 0 0 0
#nodal masses:
mass 3 5.18 0. 0.
mass 4 5.18 0. 0.
#transformation:
geomTransf Linear 1
#connectivity:
element elasticBeamColumn 1 1 3 3600 4227 1080000 1
element elasticBeamColumn 2 2 4 3600 4227 1080000 1
element elasticBeamColumn 3 3 4 5760 4227 4423680 1
#recorders
recorder Node -file Node3.out -time -node 3 -dof 1 2 disp
recorder Element -file Element1.out -time -ele 1 force
#gravity loads
pattern Plain 1 Linear {
load 3 0.0 -2000 -168074
load 4 0.0 -2000 168074
}
constraints Transformation
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-6 6
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10
loadConst -time 0.0
#Dynamic Ground Motion
# create load pattern
source ReadSMDFile.tcl
ReadSMDFile BM68elc.th BM68elc.acc dt
set accelSeries "Series -dt $dt -filePath BM68elc.acc -factor 1";
pattern UniformExcitation 2 1 -accel $accelSeries
# set damping factors
rayleigh 0. 0. 0. [expr 2*0.02/pow([eigen 1],0.5)]
# create the analysis
wipeAnalysis
constraints Plain
numberer RCM
system UmfPack
test NormDispIncr 1.0e-8 10
algorithm Newton
integrator Newmark 0.5 0.25 
analysis Transient
analyze [expr 500] 0.02