clear;clc;
DispDB30=load('CantileverDispModifyFiber1layer.out');
% DispDB2=load('CantileverDispModifyFiber2layerDB2.out');
% DispDB3=load('CantileverDispModifyFiber2layerDB3.out');
% DispDB4=load('CantileverDispModifyFiber2layerDB4.out');
DispDB6file=load('CantileverDispModifyFiber2layerDB6-file.out');
DispDB6xml=importdata('CantileverDispModifyFiber2layerDB6.out');
DispDB6=DispDB6xml.data;
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(B_u(:,1),B_u(:,2),'ko','LineWidth',1)
hold on
plot(B_v(:,1),B_v(:,2),'ks','LineWidth',1)
plot(-DispDB30(1:13189,2)/0.0393701,15*DispDB30(1:13189,1)/0.22,'k-','LineWidth',1)
plot(-DispDB30(1:13189,3)/0.0393701,15*DispDB30(1:13189,1)/0.22,'k--','LineWidth',1)
plot(-DispDB6(:,2)/0.0393701,15*DispDB6(:,1)/0.22,'r-','LineWidth',1)
plot(-DispDB6(:,3)/0.0393701,15*DispDB6(:,1)/0.22,'r--','LineWidth',1)
% plot(-DispDB4(:,2),15*DispDB4(:,1),'k-','LineWidth',1)
% plot(-DispDB4(:,3),15*DispDB4(:,1),'k--','LineWidth',1)
% plot(-DispDB3(:,2)/0.0393701,15*DispDB3(:,1)/0.22,'k-','LineWidth',1)
% plot(-DispDB3(:,3)/0.0393701,15*DispDB3(:,1)/0.22,'k--','LineWidth',1)
% plot(-DispDB2(:,2)/0.0393701,15*DispDB2(:,1)/0.22,'r-','LineWidth',1)
% plot(-DispDB2(:,3)/0.0393701,15*DispDB2(:,1)/0.22,'r--','LineWidth',1)

hold off
% legend({'Battini-u','Battini-v','DB30-u','DB30-v','DB6-u','DB6-v','DB4-u','DB4-v',...
%     'MB30-u','MB30-v','MB6-u','MB6-v','MB4-u','MB4-v'},'FontSize',4)
% legend({'Alsafadie et al. [51]-u','Alsafadie et al. [51]-v','DB3-u','DB3-v','DB2-u','DB2-v'},'FontSize',10)
legend({'Alsafadie et al. [51]-u','Alsafadie et al. [51]-v','DB30-u','DB30-v',...
    'DB6-u','DB6-v'},'FontSize',10)
legend('Location','southeast')
xlim([0 1800])
ylim([0 60])
set(gca,'XTick',(0:300:1800),'YTick',(0:10:60))
set(gca,'FontSize',10)
xlabel('Displacements (mm)','FontSize',10) 
ylabel('Load P (kN)','FontSize',10) 

% save figure
figWidth=4;
figHeight=3.5;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');