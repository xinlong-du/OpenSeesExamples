clear;clc;
FTBInElasv = csvread('FTBInElasv.csv');
FTBInElasl = csvread('FTBInElasl.csv');
FTBInElasDispMidF0001PDB2=load('FTBInElasDispMidF0001PDB2.out');
FTBInElasDispMidF0001PDB4=load('FTBInElasDispMidF0001PDB4.out');
FTBInElasDispMidF0001PDB8=load('FTBInElasDispMidF0001PDB8.out');
FTBInElasDispMidF0001PDB40=load('FTBInElasDispMidF0001P.out');
mixedFTBInElasDispMidF0001PMB2=load('mixedFTBInElasDispMidF0001PMB2.out');
mixedFTBInElasDispMidF0001PMB4=load('mixedFTBInElasDispMidF0001PMB4.out');
mixedFTBInElasDispMidF0001PMB8=load('mixedFTBInElasDispMidF0001PMB8.out');
mixedFTBInElasDispMidF0001PMB40=load('mixedFTBInElasDispMidF0001P.out');

%% plot vertical disp
figure
plot(FTBInElasv(:,1),FTBInElasv(:,2),'ko','LineWidth',1)
hold on
plot(-FTBInElasDispMidF0001PDB40(:,4),FTBInElasDispMidF0001PDB40(:,1),'k-','LineWidth',1)
plot(-mixedFTBInElasDispMidF0001PMB40(:,4),mixedFTBInElasDispMidF0001PMB40(:,1),'r--','LineWidth',1)

xlim([0 5])
ylim([1 2.8])
set(gca,'XTick',(0:1:5))
set(gca,'YTick',(1:0.2:2.8))
grid on
title('Vertical disp of O vs. P')
legend('Battini-F=P/1000','DB40-F=P/1000','MB40-F=P/1000')
xlabel('disp') 
ylabel('P/10000')
%% plot lateral disp
hfig=figure;
plot(FTBInElasl(:,1),FTBInElasl(:,2),'ko','LineWidth',0.5)
hold on
plot(FTBInElasDispMidF0001PDB2(:,3),FTBInElasDispMidF0001PDB2(:,1),'b-','LineWidth',0.5)
plot(FTBInElasDispMidF0001PDB4(:,3),FTBInElasDispMidF0001PDB4(:,1),'k:','LineWidth',0.5)
plot(FTBInElasDispMidF0001PDB8(:,3),FTBInElasDispMidF0001PDB8(:,1),'k--','LineWidth',0.5)
plot(FTBInElasDispMidF0001PDB40(:,3),FTBInElasDispMidF0001PDB40(:,1),'k-','LineWidth',0.5)
plot(mixedFTBInElasDispMidF0001PMB2(:,3),mixedFTBInElasDispMidF0001PMB2(:,1),'r-','LineWidth',0.5)
plot(mixedFTBInElasDispMidF0001PMB4(:,3),mixedFTBInElasDispMidF0001PMB4(:,1),'r:','LineWidth',0.5)
plot(mixedFTBInElasDispMidF0001PMB8(:,3),mixedFTBInElasDispMidF0001PMB8(:,1),'r-.','LineWidth',0.5)
plot(mixedFTBInElasDispMidF0001PMB40(:,3),mixedFTBInElasDispMidF0001PMB40(:,1),'r--','LineWidth',0.5)

xlim([0 60])
ylim([1 2.8])
set(gca,'XTick',(0:10:60))
set(gca,'YTick',(1:0.2:2.8))
set(gca,'FontSize',10)
xlabel('z-displacement of point O','FontSize',10) 
ylabel('Load P/1000','FontSize',10)
legend({'Battini','DB2','DB4','DB8','DB40','MB2','MB4','MB8','MB40'},'FontSize',8)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');