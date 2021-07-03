clear;clc;
FTBInElasv = csvread('FTBInElasv.csv');
FTBInElasl = csvread('FTBInElasl.csv');
InElasDispMidDB40stp1=load('InElasDispMidDB40stp1.out');
InElasDispMidDB40stp2=load('InElasDispMidDB40stp2.out');
%% plot vertical disp
figure
plot(FTBInElasv(:,1),FTBInElasv(:,2),'ko','LineWidth',1)
hold on
plot(-InElasDispMidDB40stp1(:,4),InElasDispMidDB40stp1(:,1),'k-','LineWidth',1)
plot(-InElasDispMidDB40stp2(:,4),InElasDispMidDB40stp2(:,1),'r-','LineWidth',1)
xlim([0 5])
ylim([1 2.8])
set(gca,'XTick',(0:1:5))
set(gca,'YTick',(1:0.2:2.8))
grid on
title('Vertical disp of O vs. P')
legend('Battini-F=P/1000','DB40stp1','DB40stp2')
xlabel('disp') 
ylabel('P/10000')
%% plot lateral disp
hfig=figure;
plot(FTBInElasl(:,1),FTBInElasl(:,2),'ko','LineWidth',0.5)
hold on
plot(InElasDispMidDB40stp1(:,3),InElasDispMidDB40stp1(:,1),'k-','LineWidth',1)
plot(InElasDispMidDB40stp2(:,3),InElasDispMidDB40stp2(:,1),'r-','LineWidth',1)
xlim([0 60])
ylim([1 2.8])
set(gca,'XTick',(0:10:60))
set(gca,'YTick',(1:0.2:2.8))
set(gca,'FontSize',10)
xlabel('Z-displacement of point O','FontSize',10) 
ylabel('Load P/10000','FontSize',10)
legend({'Battini and Pacoste [32]','DB40stp1','DB40stp2'},'FontSize',10)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test4DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');