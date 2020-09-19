clear;clc;
DB40Mass40=load('DB40Mass40.out');
DB40MassDens=load('DB40MassDens.out');
centrDB40Mass40=load('centroidDB40Mass40.out');
centrDB40MassDens=load('centroidDB40MassDens.out');

AbaBigMassX=xlsread('AbaMass40X.xlsx');
AbaBigMassY=xlsread('AbaMass40Y.xlsx');
AbaBigMassZ=xlsread('AbaMass40Z.xlsx');
AbaBigMassRX=xlsread('AbaMass40RX.xlsx');
AbaMassDensX=xlsread('AbaMassDensX.xlsx');
AbaMassDensY=xlsread('AbaMassDensY.xlsx');
AbaMassDensZ=xlsread('AbaMassDensZ.xlsx');
AbaMassDensRX=xlsread('AbaMassDensRX.xlsx');
% AbaBigMassRY=xlsread('AbaMass40RY.xlsx');
% AbaBigMassRZ=xlsread('AbaMass40RZ.xlsx');
%% ux
figure
plot(DB40Mass40(:,1),DB40Mass40(:,2),'k-','LineWidth',1.5)
hold on
plot(DB40MassDens(:,1),DB40MassDens(:,2),'r--','LineWidth',1.5)
plot(AbaBigMassX(:,1),AbaBigMassX(:,2),'b-','LineWidth',1.5)
plot(AbaMassDensX(:,1),AbaMassDensX(:,2),'m--','LineWidth',1.5)
plot(centrDB40Mass40(:,1),centrDB40Mass40(:,2),'g-','LineWidth',1.5)
plot(centrDB40MassDens(:,1),centrDB40MassDens(:,2),'y--','LineWidth',1.5)
legend('DB40Mass40','DB40MassDens','ABAQUS B33 40','ABAQUS B33 40 Dens',...
    'centroidDB40Mass40','centroidDB40MassDens')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
%% uy
figure
plot(DB40Mass40(:,1),DB40Mass40(:,3),'k-','LineWidth',1.5)
hold on
plot(DB40MassDens(:,1),DB40MassDens(:,3),'r--','LineWidth',1.5)
plot(AbaBigMassY(:,1),AbaBigMassY(:,2),'b-','LineWidth',1.5)
plot(AbaMassDensY(:,1),AbaMassDensY(:,2),'m--','LineWidth',1.5)
plot(centrDB40Mass40(:,1),centrDB40Mass40(:,3),'g-','LineWidth',1.5)
plot(centrDB40MassDens(:,1),centrDB40MassDens(:,3),'y--','LineWidth',1.5)
legend('DB40Mass40','DB40MassDens','ABAQUS B33 40','ABAQUS B33 40 Dens',...
    'centroidDB40Mass40','centroidDB40MassDens')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
%% uz
figure
plot(DB40Mass40(:,1),DB40Mass40(:,4),'k-','LineWidth',1.5)
hold on
plot(DB40MassDens(:,1),DB40MassDens(:,4),'r--','LineWidth',1.5)
plot(AbaBigMassZ(:,1),AbaBigMassZ(:,2),'b-','LineWidth',1.5)
plot(AbaMassDensZ(:,1),AbaMassDensZ(:,2),'m--','LineWidth',1.5)
plot(centrDB40Mass40(:,1),centrDB40Mass40(:,4),'g-','LineWidth',1.5)
plot(centrDB40MassDens(:,1),centrDB40MassDens(:,4),'y--','LineWidth',1.5)
legend('DB40Mass40','DB40MassDens','ABAQUS B33 40','ABAQUS B33 40 Dens',...
    'centroidDB40Mass40','centroidDB40MassDens')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
%% rx
figure
plot(DB40Mass40(:,1),DB40Mass40(:,5),'k-','LineWidth',1.5)
hold on
plot(DB40MassDens(:,1),DB40MassDens(:,5),'r--','LineWidth',1.5)
plot(AbaBigMassRX(:,1),AbaBigMassRX(:,2),'b-','LineWidth',1.5)
plot(AbaMassDensRX(:,1),AbaMassDensRX(:,2),'m--','LineWidth',1.5)
plot(centrDB40Mass40(:,1),centrDB40Mass40(:,5),'g-','LineWidth',1.5)
plot(centrDB40MassDens(:,1),centrDB40MassDens(:,5),'y--','LineWidth',1.5)
legend('DB40Mass40','DB40MassDens','ABAQUS B33 40','ABAQUS B33 40 Dens',...
    'centroidDB40Mass40','centroidDB40MassDens')
legend('Location','northoutside')
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Rx (rad)','FontSize',10)