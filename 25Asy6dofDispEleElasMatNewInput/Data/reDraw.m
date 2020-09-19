clear;clc;
Disp=load('CantileverDispModifyFiber2layer.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
hfig=figure;
plot(0.0393701*B_u(:,1),0.22*B_u(:,2),'ko','LineWidth',1)
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2),'ks','LineWidth',1)
plot(-Disp(1:13189,2),15*Disp(1:13189,1),'k-','LineWidth',1)
plot(-Disp(1:13189,3),15*Disp(1:13189,1),'k--','LineWidth',1)
hold off
legend({'Battini-u','Battini-v','DB30-u','DB30-v'},'FontSize',10)
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
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');