clear;clc;
DispMidFx=load('DispMidFxImperf.out');
DispMidFx10len=load('DispMidFxImperf10len.out');
Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(DispMidFx(:,5),DispMidFx(:,1),'k-','LineWidth',1)
hold on
plot(Battini(:,1),Battini(:,2),'ko','LineWidth',1)
%plot(DispMidFx10len(:,5),DispMidFx10len(:,1))
legend({'DB20','Battini (shell element)'},'FontSize',10)
legend('Location','northwest')
xlabel('Axial rotation of the midpoint','FontSize',10) 
ylabel('Applied load','FontSize',10)
ylim([0 700])
xlim([0 0.6])
set(gca,'YTick',(0:50:700))
set(gca,'XTick',(0:0.1:0.6))
set(gca,'FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');