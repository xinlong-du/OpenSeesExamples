# --------------------------------------------------------------------------------------------------
# 3D Steel L-section beam subjected to compressive load on shear center
# Xinlong Du, 5/31/2021
# dispBeamColumnAsym element for Asymmetric sections
# Test of OpenSees Database commands and restart analysis
# Xinlong Du, 6/4/2021
# --------------------------------------------------------------------------------------------------
# set systemTime [clock seconds] 
# puts "Starting Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"
# set startTime [clock clicks -milliseconds];
#from openseespy.opensees import *
from opensees import *
import numpy as np
import matplotlib.pyplot as plt
import os
# SET UP ----------------------------------------------------------------------------
wipe()
model('basic', '-ndm', 3, '-ndf', 6)
# units
inch = 1.0;
kip = 1.0;
sec = 1.0;
# Dependent units
sq_in = inch*inch;
ksi = kip/sq_in;
ft = 12.0*inch;
in4 = inch**4;
dataDir = 'Data';
#os.mkdir(dataDir);
# define GEOMETRY ------------------------------------------------------------------
for i in range(1,8):
    node(i,-9.2+9.2*i,0.0,0.0)
# define boundary conditions
fix(1, 1, 1, 1, 1, 1, 1);    
StartNode = 1;
EndNode = 7;
# Define  SECTIONS -------------------------------------------------------------
ColSecTag = 1;
# define MATERIAL properties 
Es = 27910*ksi;		# Steel Young's Modulus
nu = 0.3;
Gs = Es/2./(1+nu);  # Torsional stiffness Modulus
matID = 1;
uniaxialMaterial('Elastic', matID, Es);
# SECTION properties
J = 0.02473958*in4;
Gj = Gs*J;
z0 = 0.64625474*inch;
y0 = -0.68720012*inch;
section('FiberAsym', ColSecTag, y0, z0, '-GJ', Gj);
fiber(-0.6872,  0.6463, 0.0625, matID);
fiber(-0.5864,  0.4175, 0.0625, matID);
fiber(-0.4857,  0.1887, 0.0625, matID);
fiber(-0.3849, -0.0401, 0.0625, matID);
fiber(-0.2841, -0.2689, 0.0625, matID);
fiber(-0.1834, -0.4977, 0.0625, matID);
fiber(-0.0826, -0.7265, 0.0625, matID);
fiber( 0.0182, -0.9553, 0.0625, matID);
fiber( 0.1189, -1.1841, 0.0625, matID);
fiber( 0.2197, -1.4129, 0.0625, matID);
fiber( 0.3205, -1.6417, 0.0625, matID);
fiber( 0.4212, -1.8705, 0.0625, matID);
fiber( -0.4584, 0.7470, 0.0625, matID);
fiber( -0.2296, 0.8478, 0.0625, matID);
fiber( -0.0008, 0.9486, 0.0625, matID);
fiber( 0.2280,  1.0493, 0.0625, matID);
fiber( 0.4568,  1.1501, 0.0625, matID);
fiber( 0.6856,  1.2509, 0.0625, matID);
fiber( 0.9143,  1.3516, 0.0625, matID);
# define ELEMENTS-----------------------------------------------------------------------------------------------
# set up geometric transformations of element
ColTransfTag = 1; # all members
vecxz=[0.0, 0.0, 1.0];
geomTransf('Corotational', ColTransfTag, *vecxz);	#define geometric transformation: performs a corotational geometric transformation
# Define Beam-Column Elements
numIntgrPts = 5;	# number of Gauss integration points for nonlinear curvature distribution
beamIntTag = 1;
beamIntegration("Legendre",  beamIntTag, ColSecTag, numIntgrPts)
for i in range (1,EndNode):
    elemID = i;
    nodeI = i;
    nodeJ = i+1;
    element('dispBeamColumnAsym', elemID, *[nodeI, nodeJ], ColTransfTag, beamIntTag,'-shearCenter', *[y0, z0]);

# DO 1ST ANALYSIS--------------------------------------------------------------------------
recorder('Node', '-file', f'{dataDir}/linLinDisp1.out', '-time', '-node', *[EndNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'disp');
recorder('Node', '-file', f'{dataDir}/linLinReac1.out', '-time', '-node', *[StartNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'reaction');
 
# N = 5.0;
# timeSeries('Trig', 1, 0.0, 1.0, 1.0);
# pattern('Plain', 1, 1);
# load(EndNode, *[-N, 0.0, 0.0, 0.0, 0.0, 0.0]); 

N = 15.0;
timeSeries('Linear',1);
pattern('Plain', 1, 1);
load(EndNode, *[-N, 0.0, 0.0, 0.0, 0.0, 0.0]); 

constraints('Plain'); # how it handles boundary conditions
numberer('Plain');	   # renumber dof's to minimize band-width 
system('BandGeneral');# how to store and solve the system of equations in the analysis
test('NormDispIncr', 1.0e-08, 1000); # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm('Newton');
integrator('LoadControl', 0.0002);
#integrator ArcLength 0.05 1.0; #arclength alpha
# Dincr = -0.001; #-0.00002
#                                   #Node,  dof, 1st incr, Jd,  min,   max
# integrator('DisplacementControl', EndNode, 1,   Dincr,    1,  Dincr, -0.001);
analysis('Static');	# define type of analysis static or transient
analyze(1000,0.0002);
# analyze(8);
print('Finished 1st analysis')

# ------------------------------
# Call database, save domain
# -----------------------------
dbDir = 'db';
# os.mkdir(dbDir);
database('File','db/linLinLsecDB')
save(77) # Arbitrary commit tag

wipe()

database('File','db/linLinLsecDB')
restore(77)

# setTime(0)
# remove('loadPattern',1)

# ------------------------------
# DO 2ND ANALYSIS
# -----------------------------
recorder('Node', '-file', f'{dataDir}/linLinDisp2.out', '-time', '-node', *[EndNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'disp');
recorder('Node', '-file', f'{dataDir}/linLinReac2.out', '-time', '-node', *[StartNode], '-dof', *[1, 2, 3, 4, 5, 6,], 'reaction');
#------------------------------------------------------------- 
# N = 15.0;
# timeSeries('Linear',2);
# pattern('Plain', 2, 2);
# load(EndNode, *[-N, 0.0, 0.0, 0.0, 0.0, 0.0]); 
# define ANALYSIS PARAMETERS
#------------------------------------------------------------------------------------
constraints('Plain'); # how it handles boundary conditions
numberer('Plain');	   # renumber dof's to minimize band-width 
system('BandGeneral');# how to store and solve the system of equations in the analysis
test('NormDispIncr', 1.0e-08, 1000); # determine if convergence has been achieved at the end of an iteration step
#algorithm NewtonLineSearch;# use Newton's solution algorithm: updates tangent stiffness at every iteration
algorithm('Newton');
integrator('LoadControl', 0.0002);
analysis('Static');
analyze(600,0.0002);

# Dincr = -0.001; #-0.00002
#                                   #Node,  dof, 1st incr, Jd,  min,   max
# integrator('DisplacementControl', EndNode, 1,   Dincr,    1,  Dincr, -0.001);
# analysis('Static');	# define type of analysis static or transient
# analyze(992);

# Dincr = -0.01; #-0.00002
#                                   #Node,  dof, 1st incr, Jd,  min,   max
# integrator('DisplacementControl', EndNode, 1,   Dincr,    1,  Dincr, -0.01);
# analysis('Static');	# define type of analysis static or transient
# analyze(6900);

print('Finished 2nd analysis')
wipe();
#--------------------------------------------------------------------------------
#set finishTime [clock clicks -milliseconds];
#puts "Time taken: [expr ($finishTime-$startTime)/1000] sec"
#set systemTime [clock seconds] 
#puts "Finished Analysis: [clock format $systemTime -format "%d-%b-%Y %H:%M:%S"]"