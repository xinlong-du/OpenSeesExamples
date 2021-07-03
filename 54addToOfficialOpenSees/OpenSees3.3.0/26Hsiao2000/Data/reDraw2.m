clear;clc;
DB20Disp=load('DB20Disp.out');
MB20Disp=load('MB20Disp.out');
Exp = csvread('twist.csv');
Num = csvread('twist2.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(DB20Disp(1:13090,4),DB20Disp(1:13090,3),'k-','LineWidth',1)
hold on
plot(MB20Disp(1:13090,4),MB20Disp(1:13090,3),'r--','LineWidth',1)
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