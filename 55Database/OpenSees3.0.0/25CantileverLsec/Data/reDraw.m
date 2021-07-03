clear;clc;
DispDB6=load('DispDB6.out');
Disp1=load('Disp1.out');
Reac1=load('Reac1.out');
Disp2=load('Disp2.out');
Reac2=load('Reac2.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(0.0393701*B_u(:,1),0.22*B_u(:,2),'ko','LineWidth',1)
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2),'ks','LineWidth',1)
plot(-DispDB6(:,2),15*DispDB6(:,1),'r-','LineWidth',1)
plot(-DispDB6(:,3),15*DispDB6(:,1),'r--','LineWidth',1)
plot(-Disp1(:,2),Reac1(:,2),'b-','LineWidth',1)
plot(-Disp1(:,3),Reac1(:,2),'b--','LineWidth',1)
plot(-Disp2(:,2),Reac2(:,2),'g-','LineWidth',1)
plot(-Disp2(:,3),Reac2(:,2),'g--','LineWidth',1)
legend({'Alsafadie-u','Alsafadie-v','DB6-u','DB6-v'},'FontSize',10)
legend('Location','northwest')
xlim([0 70])
% ylim([0 16])
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