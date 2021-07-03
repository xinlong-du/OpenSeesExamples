clear;clc;
DB2=load('DispMidDB2.out');
MB2=load('DispMidMB2.out');
% Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot([0 0.6],[258 258],'b--','LineWidth',1)
hold on
plot(DB2(:,5),DB2(:,1),'k-','LineWidth',1)
plot(MB2(:,5),MB2(:,1),'r--','LineWidth',1)
legend({'Theoretical','DB2','MB2'},'FontSize',10)
legend('Location','northwest')
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
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');