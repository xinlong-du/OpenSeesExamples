clear;clc;
DispMidFx=load('DispMidDB2.out');
mixedDispMidFxMB2=load('mixedDispMidFxImperfMB2Coarse.out');
Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(DispMidFx(:,5),DispMidFx(:,1),'k-','LineWidth',1)
hold on
plot(mixedDispMidFxMB2(:,5),mixedDispMidFxMB2(:,1),'r--','LineWidth',1)
plot(Battini(:,1),Battini(:,2),'ko','LineWidth',1)
%legend({'Theoretical','MB2'},'FontSize',10)
legend({'DB2','MB2','Battini and Pacoste'},'FontSize',10)
legend('Location','southeast')
xlabel('Twist rotation of the midpoint','FontSize',10) 
ylabel('Applied load','FontSize',10)
ylim([100 600])
xlim([0 0.6])
set(gca,'YTick',(100:50:600))
set(gca,'XTick',(0:0.1:0.6))
set(gca,'FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');