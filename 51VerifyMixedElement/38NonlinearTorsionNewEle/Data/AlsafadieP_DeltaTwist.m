clear;clc;
DispEndMxDB20=load('TrahairDB20DispEnd.out');
DispEndMxMB20=load('TrahairMB20DispEnd.out');
DispEndMxDB1=load('TrahairDB1DispEnd.out');
DispEndMxMB1=load('TrahairMB1DispEnd.out');
DispEndMxDB2=load('TrahairDB2DispEnd.out');
DispEndMxMB2=load('TrahairMB2DispEnd.out');
DispEndMxDB4=load('TrahairDB4DispEnd.out');
DispEndMxMB4=load('TrahairMB4DispEnd.out');
phi=0:0.1:3.5;
TrahairNL = 80000*66.667*1000*phi/1000+0.5*200000*17.778*10^9*(phi/1000).^3;
TrahairL = 80000*66.667*1000*phi/1000;
Alsafadie = csvread('Alsafadie.csv');
%% plot u and v vs. lateral force
hfig=figure;
plot(phi,0.1*TrahairNL,'ko','LineWidth',0.5,'MarkerSize',4)
hold on
plot(phi,0.1*TrahairL,'k--','LineWidth',0.8)
plot(Alsafadie(:,1),Alsafadie(:,2),'k--','LineWidth',0.8)
% plot(DispEndMxDB1(:,5),1000*DispEndMxDB1(:,1),'k-','LineWidth',1)
% plot(DispEndMxMB1(:,5),1000*DispEndMxMB1(:,1),'r-','LineWidth',1)
plot(DispEndMxDB2(:,5),1000*DispEndMxDB2(:,1),'k-','LineWidth',1)
plot(DispEndMxMB2(:,5),1000*DispEndMxMB2(:,1),'r-','LineWidth',1)
% plot(DispEndMxDB4(:,5),1000*DispEndMxDB4(:,1),'k-','LineWidth',0.8)
% plot(DispEndMxMB4(:,5),1000*DispEndMxMB4(:,1),'r--','LineWidth',0.8)
% plot(DispEndMxDB20(:,5),10000*DispEndMxDB20(:,1),'k-.','LineWidth',1)
% plot(DispEndMxMB20(:,5),10000*DispEndMxMB20(:,1),'r-.','LineWidth',1)
legend({'Trahair-nonlinear','Trahair-linear','Alsafadie','DB2','MB2'},'FontSize',10)
%legend({'Nonlinear analytical','Linear analytical','Alsafadie - 5 bmw3d','MB4'},'FontSize',10)
legend('Location','northwest')
xlim([0 3.5])
ylim([0 9e6])
set(gca,'XTick',(0:0.5:3.5),'YTick',(0:1e6:9e6))
set(gca,'FontSize',10)
xlabel('Twist rotation at the free end','FontSize',10) 
ylabel('Applied torque','FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('testAlsafadie.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');