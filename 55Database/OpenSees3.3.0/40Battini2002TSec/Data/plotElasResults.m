clear;clc;
FTBv = csvread('FTBv.csv');
FTBl = csvread('FTBl.csv');
DispMidDB40stp1=load('ElasDispMidDB40stp1.out');
DispMidDB40stp2=load('ElasDispMidDB40stp2.out');
%% plot vertical disp
figure
plot(FTBv(:,1),FTBv(:,2))
hold on
plot(-DispMidDB40stp1(:,4),DispMidDB40stp1(:,1),'k-','LineWidth',1)
plot(-DispMidDB40stp2(:,4),DispMidDB40stp2(:,1),'r-','LineWidth',1)
xlim([0 40])
ylim([7 10])
set(gca,'XTick',(0:5:40))
set(gca,'YTick',(7:0.5:10))
grid on
title('Vertical disp vs. P')
legend('Battini-F=P/1000','DB40stp1','DB40stp2')
%% plot lateral disp
hfig=figure;
plot(FTBl(:,1),FTBl(:,2),'ko','LineWidth',0.5)
hold on
plot(DispMidDB40stp1(:,3),DispMidDB40stp1(:,1),'k-','LineWidth',1)
plot(DispMidDB40stp2(:,3),DispMidDB40stp2(:,1),'r-','LineWidth',1)
xlim([0 300])
ylim([7 10])
set(gca,'XTick',(0:50:300))
set(gca,'YTick',(7:0.5:10))
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
fileout=('test3DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');