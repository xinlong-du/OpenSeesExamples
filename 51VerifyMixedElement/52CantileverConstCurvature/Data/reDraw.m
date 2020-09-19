clear;clc;
DispEnd4LayerMyMB1=load('DispEnd4LayerMyMB1.out');
DispEnd4LayerMyMB2=load('DispEnd4LayerMyMB2.out');
DispEnd4LayerMyMB4=load('DispEnd4LayerMyMB4.out');

DispEnd4LayerMyDB1=load('DispEnd4LayerMyDB1.out');
DispEnd4LayerMyDB2=load('DispEnd4LayerMyDB2.out');
DispEnd4LayerMyDB4=load('DispEnd4LayerMyDB4.out');
%% plot Fz vs disp. z
hfig=figure;
plot(-1/240.0*DispEnd4LayerMyMB1(:,2),DispEnd4LayerMyMB1(:,1),'k-','LineWidth',1);
hold on
plot(-1/240.0*DispEnd4LayerMyMB1(:,4),DispEnd4LayerMyMB1(:,1),'k-','LineWidth',1);

plot(-1/240.0*DispEnd4LayerMyMB2(:,2),DispEnd4LayerMyMB2(:,1),'k--','LineWidth',1);
plot(-1/240.0*DispEnd4LayerMyMB2(:,4),DispEnd4LayerMyMB2(:,1),'k--','LineWidth',1);

plot(-1/240.0*DispEnd4LayerMyMB4(:,2),DispEnd4LayerMyMB4(:,1),'k-.','LineWidth',1);
plot(-1/240.0*DispEnd4LayerMyMB4(:,4),DispEnd4LayerMyMB4(:,1),'k-.','LineWidth',1);

plot(-1/240.0*DispEnd4LayerMyDB1(:,2),DispEnd4LayerMyDB1(:,1),'r-','LineWidth',1);
plot(-1/240.0*DispEnd4LayerMyDB1(:,4),DispEnd4LayerMyDB1(:,1),'r-','LineWidth',1);

plot(-1/240.0*DispEnd4LayerMyDB2(:,2),DispEnd4LayerMyDB2(:,1),'r--','LineWidth',1);
plot(-1/240.0*DispEnd4LayerMyDB2(:,4),DispEnd4LayerMyDB2(:,1),'r--','LineWidth',1);

plot(-1/240.0*DispEnd4LayerMyDB4(:,2),DispEnd4LayerMyDB4(:,1),'r-.','LineWidth',1);
plot(-1/240.0*DispEnd4LayerMyDB4(:,4),DispEnd4LayerMyDB4(:,1),'r-.','LineWidth',1);
legend({'MB1-u/L','MB1-v/L','MB2-u/L','MB2-v/L','MB4-u/L','MB4-v/L','DB1-u/L','DB1-v/L',...
    'DB2-u/L','DB2-v/L','DB4-u/L','DB4-v/L'},'FontSize',8)
legend('Location','north')
% xlim([0 250])
% ylim([0 150])
% set(gca,'XTick',(0:50:250),'YTick',(0:50:150))
% set(gca,'FontSize',10)
% xlabel('Lateral displacement (mm)','FontSize',10) 
% ylabel('Load (N)','FontSize',10)
% 
% % save figure
% figWidth=3.5;
% figHeight=3;
% set(hfig,'PaperUnits','inches');
% set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
% fileout=('test1.');
% print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% plot rotation
hfig=figure;
plot(DispEnd4LayerMyMB1(:,6),DispEnd4LayerMyMB1(:,1),'k-','LineWidth',1);
hold on
plot(DispEnd4LayerMyMB2(:,6),DispEnd4LayerMyMB2(:,1),'k--','LineWidth',1);
plot(DispEnd4LayerMyMB4(:,6),DispEnd4LayerMyMB4(:,1),'k-.','LineWidth',1);
plot(DispEnd4LayerMyDB1(1:end-2,6),DispEnd4LayerMyDB1(1:end-2,1),'r-','LineWidth',1);
plot(DispEnd4LayerMyDB2(:,6),DispEnd4LayerMyDB2(:,1),'r--','LineWidth',1);
plot(DispEnd4LayerMyDB4(:,6),DispEnd4LayerMyDB4(:,1),'r-.','LineWidth',1);
legend({'MB1-u/L','MB2-u/L','MB4-u/L','DB1-u/L','DB2-u/L','DB4-u/L'},'FontSize',8)
legend('Location','north')