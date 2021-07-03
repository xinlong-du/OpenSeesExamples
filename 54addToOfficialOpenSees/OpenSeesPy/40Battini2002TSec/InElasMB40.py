# --------------------------------------------------------------------------------------------------
# Flexural-torsional buckling of a tee beam
# Xinlong Du, 6/6/2021
# dispBeamColumn element for Asymmetric sections
# --------------------------------------------------------------------------------------------------
# set systemTime [clock seconds] 
# puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
# set startTime [clock clicks -milliseconds];
from opensees import *
import numpy as np
import matplotlib.pyplot as plt
import os

# SET UP ----------------------------------------------------------------------
wipe();
model('basic', '-ndm', 3, '-ndf', 6);
dataDir = 'Data';
#os.mkdir(dataDir);

# Define  SECTIONS ------------------------------------------------------------
ColSecTag = 1;
# MATERIAL properties 
Es = 70000.0;		# Steel Young's Modulus
nu = 0.33;
Gs = Es/2./(1+nu);  # Torsional stiffness Modulus
Fy = 20.0;
Biso = 0.2;
matID = 1;
uniaxialMaterial('Steel01', matID, Fy, Es, Biso);
# SECTION properties
J = 8424.0;
Gj = Gs*J;
y0 = 0.0;
z0 = -14.21;
section('FiberAsym', ColSecTag, y0, z0, '-GJ', Gj);
for i in range(1,41):
    fiber(-30.75+1.5*i, -17.21+0.75, 2.25, matID);
for i in range(1,41):
    fiber(-30.75+1.5*i, -17.21+2.25, 2.25, matID);
for i in range(1,41):
    fiber(-30.75+1.5*i, -17.21+3.75, 2.25, matID);
for i in range(1,41):
    fiber(-30.75+1.5*i, -17.21+5.25, 2.25, matID);
for i in range(1,37):
    fiber(-2.25, -11.21-0.75+1.5*i, 2.25, matID);
for i in range(1,37):
    fiber(-0.75, -11.21-0.75+1.5*i, 2.25, matID);
for i in range(1,37):
    fiber(0.75, -11.21-0.75+1.5*i, 2.25, matID);
for i in range(1,37):
    fiber(2.25, -11.21-0.75+1.5*i, 2.25, matID);

# define NODES and ELEMENTS----------------------------------------------------
for i in range(1,42):
    node(i,-45.0+45.0*i,0.0,0.0)
# define boundary conditions
StaNode = 1;
MidNode = 21;
EndNode = 41;
fix(StaNode, 1, 1, 1, 1, 1, 1);  
fix(EndNode, 0, 1, 1, 1, 1, 1);   

ColTransfTag = 1;
vecxz=[0.0, 0.0, 1.0];
geomTransf('Corotational', ColTransfTag, *vecxz);
# Define Beam-Column Elements
numIntgrPts = 2;	# number of Gauss integration points
beamIntTag = 1;
beamIntegration("Legendre",  beamIntTag, ColSecTag, numIntgrPts)
for i in range (1,EndNode):
    elemID = i;
    nodeI = i;
    nodeJ = i+1;
    element('mixedBeamColumnAsym', elemID, *[nodeI, nodeJ], ColTransfTag, beamIntTag,'-shearCenter', *[y0, z0]);

F = 10.0;
P = 10000.0; 
timeSeries('Linear',1);
pattern('Plain', 1, 1);
load(MidNode, *[0.0,  F, 0.0, 0.0, 0.0, 0.0]);
load(EndNode, *[-P, 0.0, 0.0, 0.0, 0.0, 0.0]);

# Define RECORDERS ------------------------------------------------------------
recorder('Node', '-file', f'{dataDir}/InElasDispEndMB40.out', '-time', '-node', *[EndNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'disp');
recorder('Node', '-file', f'{dataDir}/InElasDispMidMB40.out', '-time', '-node', *[MidNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'disp');

# define ANALYSIS PARAMETERS---------------------------------------------------
constraints('Plain'); # how it handles boundary conditions
numberer('Plain');	   # renumber dof's to minimize band-width 
system('BandGeneral');# how to store and solve the system of equations in the analysis
test('NormDispIncr', 1.0e-08, 1000); # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm('Newton');
#integrator('LoadControl', 0.01)
#integrator ArcLength 0.05 1.0; #arclength alpha
Dincr = -0.01; #-0.00002
                                  #Node,  dof, 1st incr, Jd,  min,   max
integrator('DisplacementControl', EndNode, 1,   Dincr,    1,  Dincr, -0.01);
analysis('Static');	# define type of analysis static or transient
analyze(2500);
print('Finished')

#------------------------------------------------------------------------------
# set finishTime [clock clicks -milliseconds];
# puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
# set systemTime [clock seconds] 
# puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"