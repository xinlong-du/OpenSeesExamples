clear;clc;
MB6=load('mixedCantileverDispModifyFiber2layerMB6.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(0.0393701*B_u(:,1),0.22*B_u(:,2),'ko','LineWidth',1)
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2),'ks','LineWidth',1)
plot(-MB6(:,2),15*MB6(:,1),'k-','LineWidth',1)
plot(-MB6(:,3),15*MB6(:,1),'k--','LineWidth',1)
hold off
legend({'Alsafadie-u','Alsafadie-v','MB6GP5-u','MB6GP5-v'},'FontSize',10)
legend('Location','northwest')
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
figure
plot(0.0393701*B_w(:,1),0.22*B_w(:,2),'ko')
hold on
plot(MB6(:,4),15*MB6(:,1),'k-')
legend('Battini-w','MB6-w')
xlabel('inches') 
ylabel('kips')  