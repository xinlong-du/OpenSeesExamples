clear;clc;
DispMidFx=load('DispMidFxImperf.out');
mixedDispMidFx=load('mixedDispMidFxImperf.out');
% Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(DispMidFx(:,5),DispMidFx(:,1),'k-','LineWidth',1)
hold on
plot(mixedDispMidFx(:,5),mixedDispMidFx(:,1),'r--','LineWidth',1)
% plot(Battini(:,1),Battini(:,2),'ko','LineWidth',1)
plot([0 0.6],[258 258],'b-.','LineWidth',1)
legend({'DB20','MB20','Theoretical'},'FontSize',10)
legend('Location','northwest')
xlabel('Twist rotation of the midpoint','FontSize',10) 
ylabel('Applied load','FontSize',10)
ylim([0 600])
xlim([0 0.6])
set(gca,'YTick',(0:50:600))
set(gca,'XTick',(0:0.1:0.6))
set(gca,'FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');