clear;clc;
Disp=load('CantileverDisp.out');
Disp2layer=load('CantileverDisp2layer.out');
Exp = csvread('twist.csv');
Num = csvread('twist2.csv');
%% plot u and v vs. axial force
hfig=figure;
% plot(Disp(1:13090,4),Disp(1:13090,3))
% hold on
plot(Disp2layer(1:13090,4),Disp2layer(1:13090,3),'k-','LineWidth',1)
hold on
plot(Exp(1:6,1),Exp(1:6,2),'ko','LineWidth',1)
plot(Num(:,1),Num(:,2),'ks','LineWidth',1)
legend({'DB20','Gregory (exp.)','Hsiao (num.)'},'FontSize',10)
legend('Location','northwest')
xlabel('Y (mm)','FontSize',10) 
ylabel('Z (mm)','FontSize',10) 
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