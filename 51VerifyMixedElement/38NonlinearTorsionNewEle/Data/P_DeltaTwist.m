clear;clc;
DispEndMx=load('DispEnd.out');
mixedDispEndMx=load('mixedDispEnd.out');
Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(DispEndMx(:,5),DispEndMx(:,1),'k-','LineWidth',1)
hold on
plot(mixedDispEndMx(:,5),mixedDispEndMx(:,1),'r--','LineWidth',1)
plot(Battini(:,1),Battini(:,2),'ko','LineWidth',1)
legend({'DB20','MB20','Battini'},'FontSize',10)
legend('Location','northwest')
xlim([0 2.5])
ylim([0 9000])
set(gca,'XTick',(0:0.5:2.5),'YTick',(0:1000:9000))
set(gca,'FontSize',10)
xlabel('End rotation','FontSize',10) 
ylabel('Applied moment','FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');