clear;clc;
Disp2layerDB2=load('CantileverDisp2layerDB2.out');
Disp2layerDB4=load('CantileverDisp2layerDB4.out');
Disp2layerDB20=load('CantileverDisp2layer.out');
mixedDisp2layerMB2=load('mixedCantileverDisp2layerMB2.out');
mixedDisp2layerMB4=load('mixedCantileverDisp2layerMB4.out');
mixedDisp2layerMB20=load('mixedCantileverDisp2layer.out');
Exp = csvread('twist.csv');
Num = csvread('twist2.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(Disp2layerDB20(1:13090,4),Disp2layerDB20(1:13090,3),'k-','LineWidth',1)
hold on
plot(mixedDisp2layerMB20(1:13090,4),mixedDisp2layerMB20(1:13090,3),'r--','LineWidth',1)
plot(Exp(:,1),Exp(:,2),'ko','LineWidth',1)
plot(Num(:,1),Num(:,2),'ks','LineWidth',1)
legend({'DB20','MB20','Gregory (exp.)','Hsiao (num.)'},'FontSize',10)
legend('Location','northwest')
xlabel('y (mm)','FontSize',10) 
ylabel('z (mm)','FontSize',10) 
set(gca,'YDir','reverse')
set(gca,'FontSize',10)
axis equal

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');