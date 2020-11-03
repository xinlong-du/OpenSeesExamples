clear;clc;
MB5GP5=load('MB5GP5.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(B_u(:,1),B_u(:,2),'ko','LineWidth',1)
hold on
plot(B_v(:,1),B_v(:,2),'ks','LineWidth',1)
plot(-MB5GP5(:,2),MB5GP5(:,1),'k-','LineWidth',1)
plot(-MB5GP5(:,3),MB5GP5(:,1),'k--','LineWidth',1)

hold off
legend({'Alsafadie et al. [35]-u','Alsafadie et al. [35]-v','DB3-u','DB3-v'},'FontSize',10)
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