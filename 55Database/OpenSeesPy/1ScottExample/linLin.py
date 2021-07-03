# -*- coding: utf-8 -*-
"""
Test of OpenSees Database commands and restart analysis
by Xinlong Du, 6/4/2021
"""

from opensees import *
import numpy as np
import matplotlib.pyplot as plt
import os
dataDir = 'Data';
#os.mkdir(dataDir);

# # ------------------------------
# # Define model, do first analysis
# # -----------------------------
# wipe(); # remove existing model
# model('basic', '-ndm', 2, '-ndf', 2); # set modelbuilder
# node(1, 0.0, 0.0); # create nodes
# node(2, 144.0, 0.0);
# fix(1, 1, 1); # set boundary condition
# fix(2, 0, 1);
# uniaxialMaterial("Steel01", 1, 36.0, 29000, 0.1); # define materials
# element("Truss",1,*[1,2],10.0,1); # define elements

# # timeSeries('Trig', 1, 0.0, 1.0, 1.0); # create TimeSeries
# # pattern("Plain", 1, 1); # create a plain load pattern
# # load(2, *[400.0, 0.0]); # Create the nodal load - command: load nodeID xForce yForce

# timeSeries('Linear', 1); # create TimeSeries
# pattern("Plain", 1, 1); # create a plain load pattern
# load(2, *[400.0, 0.0]); # Create the nodal load - command: load nodeID xForce yForce

# recorder('Node', '-file', f'{dataDir}/linLinDisp1.out', '-time', '-node', *[2], '-dof', *[1], 'disp');
# recorder('Node', '-file', f'{dataDir}/linLinReac1.out', '-time', '-node', *[1], '-dof', *[1], 'reaction');

# system("BandSPD");               # create SOE
# numberer("RCM");                 # create DOF number
# constraints("Plain");            # create constraint handler
# integrator("LoadControl", 0.01);  # create integrator
# algorithm("Newton");             # create algorithm
# test('NormDispIncr', 1.0e-8, 10, 2)
# analysis("Static");              # create analysis object
# analyze(100,0.01);                 # perform the analysis

# # ------------------------------
# # Call database, save domain
# # -----------------------------
# dbDir = 'db';
# # os.mkdir(dbDir);
# database('File','db/linLinDB')
# save(76) # Arbitrary commit tag

# wipe()

# database('File','db/linLinDB')
# restore(76)

# # setTime(0)
# # remove('loadPattern',1)

# # ------------------------------
# # Do second analysis
# # -----------------------------
# # timeSeries('Linear', 2); # create TimeSeries
# # pattern("Plain", 2, 2); # create a plain load pattern
# # load(2, *[400.0, 0.0]); # Create the nodal load - command: load nodeID xForce yForce

# recorder('Node', '-file', f'{dataDir}/linLinDisp2.out', '-time', '-node', *[2], '-dof', *[1], 'disp');
# recorder('Node', '-file', f'{dataDir}/linLinReac2.out', '-time', '-node', *[1], '-dof', *[1], 'reaction');

# system("BandSPD");               # create SOE
# numberer("RCM");                 # create DOF number
# constraints("Plain");            # create constraint handler
# integrator("LoadControl", 0.01);  # create integrator
# algorithm("Newton");             # create algorithm
# test('NormDispIncr', 1.0e-8, 10, 2)
# analysis("Static");              # create analysis object
# analyze(100,0.01);                 # perform the analysis

# plot results-----------------------------------------------------------------
fig = plt.figure()
Disp1=np.loadtxt(f'{dataDir}/linLinDisp1.out')
Reac1=np.loadtxt(f'{dataDir}/linLinReac1.out')
plt.plot(Disp1[:,1],-Reac1[:,1])
plt.xlim(-0.4,0.4)
plt.ylim(-400,400)
plt.grid()
fig = plt.figure()
Disp2=np.loadtxt(f'{dataDir}/linLinDisp2.out')
Reac2=np.loadtxt(f'{dataDir}/linLinReac2.out')
plt.plot(Disp2[:,1],-Reac2[:,1])
# plt.xlim(-0.4,0.4)
# plt.ylim(-400,400)
plt.grid()