clear;clc;
FTBInElasv = csvread('FTBInElasv.csv');
FTBInElasl = csvread('FTBInElasl.csv');
InElasDispMidDB40=load('InElasDispMidDB40.out');
%% plot vertical disp
figure
plot(FTBInElasv(:,1),FTBInElasv(:,2),'ko','LineWidth',1)
hold on
plot(-InElasDispMidDB40(:,4),InElasDispMidDB40(:,1),'k-','LineWidth',1)
xlim([0 5])
ylim([1 2.8])
set(gca,'XTick',(0:1:5))
set(gca,'YTick',(1:0.2:2.8))
grid on
title('Vertical disp of O vs. P')
legend('Battini-F=P/1000','DB40-F=P/1000')
xlabel('disp') 
ylabel('P/10000')
%% plot lateral disp
hfig=figure;
plot(FTBInElasl(:,1),FTBInElasl(:,2),'ko','LineWidth',0.5)
hold on
plot(InElasDispMidDB40(:,3),InElasDispMidDB40(:,1),'k-','LineWidth',1)
xlim([0 60])
ylim([1 2.8])
set(gca,'XTick',(0:10:60))
set(gca,'YTick',(1:0.2:2.8))
set(gca,'FontSize',10)
xlabel('Z-displacement of point O','FontSize',10) 
ylabel('Load P/10000','FontSize',10)
legend({'Battini and Pacoste [32]','DB40'},'FontSize',10)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test4DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');