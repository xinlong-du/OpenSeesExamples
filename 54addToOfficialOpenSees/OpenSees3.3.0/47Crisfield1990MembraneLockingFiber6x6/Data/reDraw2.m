clear;clc;
DispEnd8Layer10ele=load('DispEnd8Layer10ele.out');
DispEnd8Layer20ele=load('DispEnd8Layer20ele.out');
mixedDispEnd8Layer10ele=load('mixedDispEnd8Layer10ele.out');
mixedDispEnd8Layer20ele=load('mixedDispEnd8Layer20ele.out');

AlemDisp = csvread('Alemdar Disp.csv');
Crisfield = csvread('Crisfield.csv');
Simo = csvread('Simo.csv');
%% only 8 layer examples
hfig=figure;
plot(DispEnd8Layer10ele(11:end,4),DispEnd8Layer10ele(11:end,1),'k-','Marker','.',...
    'MarkerSize',12,'MarkerIndices',(1:800:15000),'LineWidth',0.8)
hold on
plot(DispEnd8Layer20ele(11:end,4),DispEnd8Layer20ele(11:end,1),'k:','Marker','+',...
    'MarkerSize',5,'MarkerIndices',(1:800:15000),'LineWidth',0.8)
plot(mixedDispEnd8Layer10ele(11:end,4),mixedDispEnd8Layer10ele(11:end,1),'k-','Marker','x',...
    'MarkerSize',5,'MarkerIndices',(400:800:15000),'LineWidth',0.8)
plot(mixedDispEnd8Layer20ele(11:end,4),mixedDispEnd8Layer20ele(11:end,1),'k:','Marker','*',...
    'MarkerSize',5,'MarkerIndices',(400:800:15000),'LineWidth',0.8)

plot(AlemDisp(:,1),AlemDisp(:,2),'k--','LineWidth',0.8)
% plot(Crisfield(:,1),Crisfield(:,2),'kd','LineWidth',1)
plot(Simo(:,1),Simo(:,2),'k-.','LineWidth',0.8)
legend({'DB10','DB20','MB10','MB20','Alemdar','Simo and Vu-Quoc'},'FontSize',10)
legend('Location','southeast')
xlim([0 70])
ylim([0.5 1.5])
set(gca,'XTick',(0:10:70),'YTick',(0.5:0.2:1.5))
set(gca,'FontSize',10)
xlabel('Lateral displacement (mm)','FontSize',10) 
ylabel('Load (N)','FontSize',10)

% save figure
figWidth=4.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');