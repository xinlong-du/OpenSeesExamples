clear;clc;
DB2=load('DispMidDB2.out');
DB20=load('DispMidDB20.out');
Battini = csvread('BattiniBw3d.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(Battini(:,1),Battini(:,2),'b:','LineWidth',1)
hold on
plot([0 0.6],[258 258],'b--','LineWidth',1)
plot([0 0.6],[273 273],'b-.','LineWidth',1)
plot(DB2(:,5),DB2(:,1),'k-','LineWidth',1)
plot(DB20(:,5),DB20(:,1),'r--','LineWidth',1)
legend({'20 bw3d by Battini and Pacoste [31]','Theoretical (258)',...
    'Theoretical (273)','DB2','DB20'},'FontSize',9)
legend('Location','northwest')
xlabel('Twist rotation of the midpoint','FontSize',10) 
ylabel('Applied load','FontSize',10)
ylim([100 700])
xlim([0 0.6])
set(gca,'YTick',(100:50:700))
set(gca,'XTick',(0:0.1:0.6))
set(gca,'FontSize',10)

% save figure
figWidth=4.5;
figHeight=3.5;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');