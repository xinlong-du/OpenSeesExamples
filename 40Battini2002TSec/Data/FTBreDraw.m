clear;clc;
FTBv = csvread('FTBv.csv');
FTBl = csvread('FTBl.csv');
FTBDispMidF0001P=load('FTBDispMidF0001P.out');

%% plot vertical disp
figure
plot(FTBv(:,1),FTBv(:,2))
hold on
plot(-FTBDispMidF0001P(:,4),FTBDispMidF0001P(:,1))

xlim([0 40])
ylim([7 10])
set(gca,'XTick',(0:5:40))
set(gca,'YTick',(7:0.5:10))
grid on
title('Vertical disp vs. P')
legend('Battini-F=P/1000','DB40-F=P/1000')
%% plot lateral disp
hfig=figure;
plot(FTBl(:,1),FTBl(:,2),'k-','LineWidth',1)
hold on
plot(FTBDispMidF0001P(:,3),FTBDispMidF0001P(:,1),'k--','LineWidth',1)
xlim([0 300])
ylim([7 10])
set(gca,'XTick',(0:50:300))
set(gca,'YTick',(7:0.5:10))
set(gca,'FontSize',10)
xlabel('z-displacement of point O','FontSize',10) 
ylabel('Load P/1000','FontSize',10)
legend({'Battini-F=P/1000','DB40-F=P/1000'},'FontSize',10)
legend('Location','southeast')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');