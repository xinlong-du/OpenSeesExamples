clear;clc;
DB40=load('DB40.out');
DB40bigMass=load('DB40bigMass.out');

AbaBigMassX=xlsread('AbaBigMassX.xlsx');
AbaBigMassY=xlsread('AbaBigMassY.xlsx');
AbaBigMassZ=xlsread('AbaBigMassZ.xlsx');
AbaBigMassRX=xlsread('AbaBigMassRX.xlsx');
%% plot Ux
% figure
% plot(DB40(:,1),DB40(:,4),'k-','LineWidth',1.5)

%%
figure
plot(DB40bigMass(:,1),DB40bigMass(:,2),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassX(:,1),AbaBigMassX(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)

figure
plot(DB40bigMass(:,1),DB40bigMass(:,3),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassY(:,1),AbaBigMassY(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)

figure
plot(DB40bigMass(:,1),DB40bigMass(:,4),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassZ(:,1),AbaBigMassZ(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)

figure
plot(DB40bigMass(:,1),DB40bigMass(:,5),'k-','LineWidth',1.5)
hold on
plot(AbaBigMassRX(:,1),AbaBigMassRX(:,2),'r-','LineWidth',1.5)
legend('DB40','ABAQUS B33 40')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Rx (m)','FontSize',10)