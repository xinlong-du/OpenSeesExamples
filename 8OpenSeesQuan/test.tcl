wipe;
model basic -ndm 2 -ndf 2
node 1 0.0 0.0
node 2 10.0 0.0 -mass 10000.0 10000.0
fix 1 1 1 
fix 2 0 1
set strainList {0 0.01 0.02 0.03 0.04 0.05 0.07 0.09}
set stressList {0 2 3 3.5 3 2.5 2.0 1.0}
uniaxialMaterial GeneralElasticMaterial 1 -strain $strainList -stress $stressList
element truss 1 1 2 1 1
recorder Node -file T1node2.out -time -node 2 -dof 1 2 disp
recorder Element -file T1stress.out -time -ele 1 -material stress
recorder Element -file T1strain.out -time -ele 1 -material strain
set tabas "Path -filePath tabas.txt -dt 0.01 -factor 200"
pattern UniformExcitation 1 1 -accel $tabas
constraints Transformation
numberer RCM
test NormDispIncr 1.E-8 25 2
algorithm Newton
system BandSPD
integrator Newmark 0.55 0.275625
analysis Transient
analyze 4000 0.01