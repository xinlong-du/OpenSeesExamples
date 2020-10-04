clear;clc;
DispEnd=load('DispEnd.out');
DispEnd4Layer=load('DispEnd4Layer.out');
DispEnd8Layer10ele=load('DispEnd8Layer10ele.out');
DispEnd4Layer20ele=load('DispEnd4Layer20ele.out');
DispEnd8Layer20ele=load('DispEnd8Layer20ele.out');
DispEnd4Layer40ele=load('DispEnd4Layer40ele.out');
DispEnd8Layer40ele=load('DispEnd8Layer40ele.out');
DispEndOO=load('DispEndOriginOpenSees.out');
DispEnd4LayerOO=load('DispEnd4LayerOriginOpenSees.out');
DispEnd8Layer10eleOO=load('DispEnd8Layer10eleOriginOpenSees.out');
AlemDisp = csvread('Alemdar Disp.csv');
Crisfield = csvread('Crisfield.csv');
Simo = csvread('Simo.csv');

%% only 8 layer examples
hfig=figure;
plot(DispEnd8Layer10ele(11:end,4),DispEnd8Layer10ele(11:end,1),'k-','LineWidth',1)
hold on
plot(DispEnd8Layer20ele(11:end,4),DispEnd8Layer20ele(11:end,1),'k--','LineWidth',1)
plot(DispEnd8Layer40ele(11:end,4),DispEnd8Layer40ele(11:end,1),'k-.','LineWidth',1)
%plot(DispEnd8Layer10eleOO(11:end,4),DispEnd8Layer10eleOO(11:end,1),'--')
plot(AlemDisp(:,1),AlemDisp(:,2),'kd','LineWidth',1)
plot(Crisfield(:,1),Crisfield(:,2),'ks','LineWidth',1)
plot(Simo(:,1),Simo(:,2),'ko','LineWidth',1)
% legend('DB10','DB104Layer','DB10OO','DB104LayerOO')
legend({'DB10','DB20','DB40','Alemdar [26]','Crisfield [3]','Simo and Vu-Quoc [40]'},'FontSize',10)
legend('Location','southeast')
xlim([0 70])
ylim([0.5 1.5])
set(gca,'XTick',(0:10:70),'YTick',(0.5:0.2:1.5))
set(gca,'FontSize',10)
xlabel('Lateral displacement (mm)','FontSize',10) 
ylabel('Load P (N)','FontSize',10)

% save figure
figWidth=4.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');