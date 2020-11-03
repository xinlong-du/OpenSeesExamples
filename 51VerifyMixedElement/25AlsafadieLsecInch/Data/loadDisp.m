clear;clc;
MB6=load('mixedCantileverDispModifyFiber2layerMB6.out');
MB6GP2=load('mixedCantileverDispModifyFiber2layerMB6GP2.out');
MB5GP2=load('mixedCantileverDispModifyFiber2layerMB5GP2.out');
MB5GP5=load('mixedCantileverDispModifyFiber2layerMB5GP5.out');
MB4GP2=load('mixedCantileverDispModifyFiber2layerMB4GP2.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(B_u(:,1),B_u(:,2),'ko','LineWidth',1)
hold on
plot(B_v(:,1),B_v(:,2),'ks','LineWidth',1)
% plot(-MB6(:,2)/0.0393701,15*MB6(:,1)/0.22,'k-','LineWidth',1)
% plot(-MB6(:,3)/0.0393701,15*MB6(:,1)/0.22,'k--','LineWidth',1)
% plot(-MB6GP2(:,2)/0.0393701,15*MB6GP2(:,1)/0.22,'r-','LineWidth',1)
% plot(-MB6GP2(:,3)/0.0393701,15*MB6GP2(:,1)/0.22,'r--','LineWidth',1)
plot(-MB5GP2(:,2)/0.0393701,15*MB5GP2(:,1)/0.22,'k-','LineWidth',1)
plot(-MB5GP2(:,3)/0.0393701,15*MB5GP2(:,1)/0.22,'k--','LineWidth',1)
% plot(-MB5GP5(:,2)/0.0393701,15*MB5GP5(:,1)/0.22,'b-','LineWidth',1)
% plot(-MB5GP5(:,3)/0.0393701,15*MB5GP5(:,1)/0.22,'b--','LineWidth',1)
% plot(-MB4GP2(:,2)/0.0393701,15*MB4GP2(:,1)/0.22,'g-','LineWidth',1)
% plot(-MB4GP2(:,3)/0.0393701,15*MB4GP2(:,1)/0.22,'g--','LineWidth',1)
hold off
legend({'Alsafadie et al.-u','Alsafadie et al.-v','MB5-u','MB5-v'},'FontSize',10)
% legend({'Alsafadie et al.-u','Alsafadie et al.-v','MB5GP2-u','MB5GP2-v','MB5GP5-u','MB5GP5-v'},'FontSize',10)
% legend({'Alsafadie et al. [35]-u','Alsafadie et al. [35]-v','MB6GP5-u','MB6GP5-v',...
%     'MB6GP2-u','MB6GP2-v','MB5GP2-u','MB5GP2-v','MB4GP2-u','MB4GP2-v'},'FontSize',6)
legend('Location','northwest')
xlim([0 1400])
ylim([0 50])
set(gca,'XTick',(0:200:1400),'YTick',(0:10:50))
set(gca,'FontSize',10)
xlabel('Displacements (mm)','FontSize',10) 
ylabel('Load P (kN)','FontSize',10) 
% grid on
% save figure
figWidth=4;
figHeight=3.5;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');