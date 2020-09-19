%% Elastic
clear;clc;
ElasDB40=load('LeeFrameElasDB40MN.out');
ElasMB40=load('LeeFrameElasMB40MN.out');
ux = csvread('ux.csv');
uy = csvread('uy.csv');
uz = csvread('uz.csv');
%% Uz of point A
hfig=figure;
plot(ElasDB40(:,1),ElasDB40(:,4),'k-','LineWidth',1)
hold on
plot(ElasMB40(:,1),ElasMB40(:,4),'r--','LineWidth',1)
plot(uz(:,1),uz(:,2),'ko','LineWidth',1)
legend({'DB40','MB40','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uz of point A','FontSize',10)
xlim([0 0.8])
ylim([-2 2])
set(gca,'XTick',(0:0.2:0.8))
set(gca,'YTick',(-2:1:2))
grid on
%% Uy of point A
hfig=figure;
plot(ElasDB40(:,1),ElasDB40(:,3),'k-','LineWidth',1)
hold on
plot(ElasMB40(:,1),ElasMB40(:,3),'r--','LineWidth',1)
plot(uy(:,1),uy(:,2),'ko','LineWidth',1)
legend({'DB40','MB40','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uy of point A','FontSize',10)
xlim([0 0.8])
ylim([-0.6 0.6])
set(gca,'XTick',(0:0.2:0.8))
set(gca,'YTick',(-0.6:0.2:0.6))
grid on
%% Ux of point A
hfig=figure;
plot(ElasDB40(:,1),ElasDB40(:,2),'k-','LineWidth',1)
hold on
plot(ElasMB40(:,1),ElasMB40(:,2),'r--','LineWidth',1)
plot(ux(:,1),ux(:,2),'ko','LineWidth',1)
legend({'DB40','MB40','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Ux of point A','FontSize',10)
xlim([0 0.8])
ylim([-0.1 0.4])
set(gca,'XTick',(0:0.2:0.8))
set(gca,'YTick',(-0.1:0.1:0.4))
grid on

% xlim([0 95])
% ylim([-15 25])
% set(gca,'XTick',(0:10:95))
% set(gca,'YTick',(-15:10:25))
% set(gca,'FontSize',10)
% % save figure
% figWidth=3.5;
% figHeight=3;
% set(hfig,'PaperUnits','inches');
% set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
% fileout=('test1.');
% print(hfig,[fileout,'tif'],'-r800','-dtiff');