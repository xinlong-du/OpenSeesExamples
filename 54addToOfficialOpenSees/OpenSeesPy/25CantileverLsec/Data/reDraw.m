clear;clc;
DispDB6=load('DispDB6.out');
DispMB6=load('DispMB6.out');
loadCtrlDispDB6=load('loadCtrlDispDB6.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(0.0393701*B_u(:,1),0.22*B_u(:,2),'ko','LineWidth',1)
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2),'ks','LineWidth',1)
% plot(-DispDB6(:,2),15*DispDB6(:,1),'r-','LineWidth',1)
% plot(-DispDB6(:,3),15*DispDB6(:,1),'r--','LineWidth',1)
% plot(-DispMB6(:,2),15*DispMB6(:,1),'b-','LineWidth',1)
% plot(-DispMB6(:,3),15*DispMB6(:,1),'b--','LineWidth',1)
plot(-loadCtrlDispDB6(:,2),15*loadCtrlDispDB6(:,1),'r-','LineWidth',1)
plot(-loadCtrlDispDB6(:,3),15*loadCtrlDispDB6(:,1),'r--','LineWidth',1)
hold off
% legend({'Alsafadie-u','Alsafadie-v','DB6-u','DB6-v','MB6-u','MB6-v'},'FontSize',10)
% legend('Location','northwest')
xlim([0 70])
ylim([0 16])
set(gca,'XTick',(0:10:70),'YTick',(0:2:16))
set(gca,'FontSize',10)
xlabel('Displacements (inches)','FontSize',10) 
ylabel('Load P (kips)','FontSize',10) 

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% plot w vs. axial force
% figure
% plot(0.0393701*B_w(:,1),0.22*B_w(:,2),'ko')
% hold on
% plot(Disp(1:13189,4),15*Disp(1:13189,1),'k-')
% plot(mixedDisp(1:13189,4),15*mixedDisp(1:13189,1),'r-')
% legend('Battini-w','DB30-w','MB30-w')
% xlabel('inches') 
% ylabel('kips')  