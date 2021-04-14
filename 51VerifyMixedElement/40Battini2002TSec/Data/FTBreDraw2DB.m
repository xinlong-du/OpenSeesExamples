clear;clc;
FTBv = csvread('FTBv.csv');
FTBl = csvread('FTBl.csv');
FTBDispMidF0001PDB2=load('FTBDispMidF0001PDB2.out');
FTBDispMidF0001PDB4=load('FTBDispMidF0001PDB4.out');
FTBDispMidF0001PDB8=load('FTBDispMidF0001PDB8.out');
FTBDispMidF0001PDB40=load('FTBDispMidF0001P.out');
mixedFTBDispMidF0001PMB2=load('mixedFTBDispMidF0001PMB2.out');
mixedFTBDispMidF0001PMB4=load('mixedFTBDispMidF0001PMB4.out');
mixedFTBDispMidF0001PMB8=load('mixedFTBDispMidF0001PMB8.out');
mixedFTBDispMidF0001PMB40=load('mixedFTBDispMidF0001P.out');

%% plot vertical disp
figure
plot(FTBv(:,1),FTBv(:,2))
hold on
plot(-FTBDispMidF0001PDB40(:,4),FTBDispMidF0001PDB40(:,1))
plot(-mixedFTBDispMidF0001PMB40(:,4),mixedFTBDispMidF0001PMB40(:,1))

xlim([0 40])
ylim([7 10])
set(gca,'XTick',(0:5:40))
set(gca,'YTick',(7:0.5:10))
grid on
title('Vertical disp vs. P')
legend('Battini-F=P/1000','DB40-F=P/1000','MB40-F=P/1000')
%% plot lateral disp
hfig=figure;
plot(FTBl(:,1),FTBl(:,2),'ko','LineWidth',0.5)
hold on
% plot(FTBDispMidF0001PDB2(:,3),FTBDispMidF0001PDB2(:,1),'k--','LineWidth',1)
plot(FTBDispMidF0001PDB4(:,3),FTBDispMidF0001PDB4(:,1),'k--','LineWidth',1)
plot(FTBDispMidF0001PDB8(:,3),FTBDispMidF0001PDB8(:,1),'k-','LineWidth',1)
% plot(FTBDispMidF0001PDB40(:,3),FTBDispMidF0001PDB40(:,1),'k-','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB2(:,3),mixedFTBDispMidF0001PMB2(:,1),'r-','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB4(:,3),mixedFTBDispMidF0001PMB4(:,1),'r--','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB8(:,3),mixedFTBDispMidF0001PMB8(:,1),'r-','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB40(:,3),mixedFTBDispMidF0001PMB40(:,1),'r--','LineWidth',1)
xlim([0 300])
ylim([7 10])
set(gca,'XTick',(0:50:300))
set(gca,'YTick',(7:0.5:10))
set(gca,'FontSize',10)
xlabel('Z-displacement of point O','FontSize',10) 
ylabel('Load P/10000','FontSize',10)
legend({'Battini and Pacoste [32]','DB4','DB8'},'FontSize',10)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test3DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');