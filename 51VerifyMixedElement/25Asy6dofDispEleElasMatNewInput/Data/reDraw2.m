clear;clc;
Disp=load('CantileverDispModifyFiber2layer.out');
DispDB4=load('CantileverDispModifyFiber2layerDB4.out');
DispDB6=load('CantileverDispModifyFiber2layerDB6.out');
mixedDisp=load('mixedCantileverDispModifyFiber2layer.out');
mixedDispMB4=load('mixedCantileverDispModifyFiber2layerMB4.out');
mixedDispMB6=load('mixedCantileverDispModifyFiber2layerMB6.out');
mixedDispMB6GP2=load('mixedCantileverDispModifyFiber2layerMB6GP2.out');
mixedDispMB6GP9=load('mixedCantileverDispModifyFiber2layerMB6GP9.out');
mixedDispMB4GP2=load('mixedCantileverDispModifyFiber2layerMB4GP2.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(0.0393701*B_u(:,1),0.22*B_u(:,2),'ko','LineWidth',1)
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2),'ks','LineWidth',1)
plot(-DispDB6(:,2),15*DispDB6(:,1),'k-','LineWidth',1)
plot(-DispDB6(:,3),15*DispDB6(:,1),'k--','LineWidth',1)
plot(-mixedDispMB6(:,2),15*mixedDispMB6(:,1),'r-','LineWidth',1)
plot(-mixedDispMB6(:,3),15*mixedDispMB6(:,1),'r--','LineWidth',1)
plot(-mixedDispMB6GP2(:,2),15*mixedDispMB6GP2(:,1),'b-','LineWidth',1)
plot(-mixedDispMB6GP2(:,3),15*mixedDispMB6GP2(:,1),'b--','LineWidth',1)
% plot(-mixedDispMB6GP9(:,2),15*mixedDispMB6GP9(:,1),'m-','LineWidth',1)
% plot(-mixedDispMB6GP9(:,3),15*mixedDispMB6GP9(:,1),'m--','LineWidth',1)
plot(-mixedDispMB4GP2(:,2),15*mixedDispMB4GP2(:,1),'g-','LineWidth',1)
plot(-mixedDispMB4GP2(:,3),15*mixedDispMB4GP2(:,1),'g--','LineWidth',1)
hold off
legend({'Alsafadie-u','Alsafadie-v','DB6-u','DB6-v',...
    'MB6-u','MB6-v','MB6GP2-u','MB6GP2-v','MB4GP2-u','MB4GP2-v'},'FontSize',6)
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
plot(Disp(1:13189,4),15*Disp(1:13189,1),'k-')
plot(mixedDisp(1:13189,4),15*mixedDisp(1:13189,1),'r-')
legend('Battini-w','DB30-w','MB30-w')
xlabel('inches') 
ylabel('kips')  