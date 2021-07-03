clear;clc;
DispDB30=load('CantileverDispModifyFiber1layer.out');
DispDB6xml=importdata('CantileverDispModifyFiber2layerDB6.out');
DispDB6=DispDB6xml.data;
% DispDB6np1xml=importdata('np1DispDB6.out');
% DispDB6np1=DispDB6np1xml.data;
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
% plot(-DispDB6np1(:,2)/0.0393701,15*DispDB6np1(:,1)/0.22,'b-','LineWidth',1)
% plot(-DispDB6np1(:,3)/0.0393701,15*DispDB6np1(:,1)/0.22,'b--','LineWidth',1)
hold off
legend({'Alsafadie et al. [51]-u','Alsafadie et al. [51]-v','np6DB30-u','np6DB30-v',...
    'np2DB6-u','np2DB6-v'},'FontSize',8)
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