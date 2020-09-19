clear;clc;
dispDispEndMx=load('TrahairDB20DispEnd.out');
dispDispEndMxDB1=load('TrahairDB1DispEnd.out');
Trahair = csvread('Trahair.csv');
TrahairL = csvread('TrahairLinear.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(Trahair(:,1),Trahair(:,2),'ko','LineWidth',1)
hold on
plot(TrahairL(:,1),TrahairL(:,2),'k--','LineWidth',1)
plot(dispDispEndMxDB1(:,5),10000*dispDispEndMxDB1(:,1),'k-','LineWidth',1)
plot(dispDispEndMx(:,5),10000*dispDispEndMx(:,1),'r--','LineWidth',1)

legend({'Trahair-nonlinear','Trahair-linear','DB1','DB20'},'FontSize',10)
legend('Location','northwest')
xlim([0 1.4])
ylim([0 14e6])
set(gca,'XTick',(0:0.2:1.4),'YTick',(0:2e6:14e6))
set(gca,'FontSize',10)
xlabel('End rotation (rad)','FontSize',10) 
ylabel('End torque (Nmm)','FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');