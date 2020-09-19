clear;clc;
DB40bigMass=load('DB40.out');

AbaBigMassX=xlsread('AbaX.xlsx');
AbaBigMassY=xlsread('AbaY.xlsx');
AbaBigMassZ=xlsread('AbaZ.xlsx');
AbaBigMassRX=xlsread('AbaRX.xlsx');
AbaBigMassRY=xlsread('AbaRY.xlsx');
AbaBigMassRZ=xlsread('AbaRZ.xlsx');
%% ux
figure
plot(DB40bigMass(:,1),DB40bigMass(:,2),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassX(:,1),AbaBigMassX(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
%% uy
figure
plot(DB40bigMass(:,1),DB40bigMass(:,3),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassY(:,1),AbaBigMassY(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
%% uz
figure
plot(DB40bigMass(:,1),DB40bigMass(:,4),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassZ(:,1),AbaBigMassZ(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
%% rx
figure
plot(DB40bigMass(:,1),DB40bigMass(:,5),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassRX(:,1),AbaBigMassRX(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Rx (rad)','FontSize',10)
%% ry
figure
plot(DB40bigMass(:,1),DB40bigMass(:,6),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassRY(:,1),AbaBigMassRY(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ry (rad)','FontSize',10)
%% rz
figure
plot(DB40bigMass(:,1),DB40bigMass(:,7),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassRZ(:,1),AbaBigMassRZ(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Rz (rad)','FontSize',10)