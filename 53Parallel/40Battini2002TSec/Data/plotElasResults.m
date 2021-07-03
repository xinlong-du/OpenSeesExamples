clear;clc;
FTBv = csvread('FTBv.csv');
FTBl = csvread('FTBl.csv');
np1DispMidDB40=load('np1t10sElasDispMidDB40.out');
np2DispMidDB40=load('np2t8sElasDispMidDB40.out');
np5DispMidDB40=load('np5t5sElasDispMidDB40.out');
np8DispMidDB40=load('np8t4sElasDispMidDB40.out');
%% plot vertical disp
figure
plot(FTBv(:,1),FTBv(:,2))
hold on
plot(-np1DispMidDB40(:,4),np1DispMidDB40(:,1),'k-','LineWidth',1)
plot(-np2DispMidDB40(:,4),np2DispMidDB40(:,1),'b--','LineWidth',1)
plot(-np5DispMidDB40(:,4),np5DispMidDB40(:,1),'r--','LineWidth',1)
plot(-np8DispMidDB40(:,4),np8DispMidDB40(:,1),'r-.','LineWidth',1)
xlim([0 40])
ylim([7 10])
set(gca,'XTick',(0:5:40))
set(gca,'YTick',(7:0.5:10))
grid on
title('Vertical disp vs. P')
legend('Battini','np1 t10s DB40','np1 t8s DB40','np5 t5s DB40','np8 t4s DB40')
%% plot lateral disp
hfig=figure;
plot(FTBl(:,1),FTBl(:,2),'ko','LineWidth',0.5)
hold on
plot(np1DispMidDB40(:,3),np1DispMidDB40(:,1),'k-','LineWidth',1)
plot(np2DispMidDB40(:,3),np2DispMidDB40(:,1),'b--','LineWidth',1)
plot(np5DispMidDB40(:,3),np5DispMidDB40(:,1),'r--','LineWidth',1)
plot(np8DispMidDB40(:,3),np8DispMidDB40(:,1),'r-.','LineWidth',1)
xlim([0 300])
ylim([7 10])
set(gca,'XTick',(0:50:300))
set(gca,'YTick',(7:0.5:10))
set(gca,'FontSize',10)
xlabel('Z-displacement of point O','FontSize',10) 
ylabel('Load P/10000','FontSize',10)
legend({'Battini and Pacoste [32]','np1 t10s DB40','np2 t8s DB40','np5 t5s DB40','np8 t4s DB40'},'FontSize',10)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test3DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');