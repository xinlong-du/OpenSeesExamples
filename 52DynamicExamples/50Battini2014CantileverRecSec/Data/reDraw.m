%% Elastic
clear;clc;
DB20=load('CantileverDB40.out');
MB20=load('CantileverMB20.out');
ux = csvread('ux.csv');
uy = csvread('uy.csv');
uz = csvread('uz.csv');
%% Uz of point A
hfig=figure;
plot(DB20(:,1),DB20(:,4),'k-','LineWidth',1)
hold on
plot(MB20(:,1),MB20(:,4),'r--','LineWidth',1)
plot(uz(:,1),uz(:,2),'b--','LineWidth',1)
legend({'DB20','MB20','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uz of point A','FontSize',10)
xlim([0 1.0])
ylim([-8 8])
set(gca,'XTick',(0:0.2:1.0))
set(gca,'YTick',(-8:2:8))
grid on
%% Uy of point A
hfig=figure;
plot(DB20(:,1),DB20(:,3),'k-','LineWidth',1)
hold on
plot(MB20(:,1),MB20(:,3),'r--','LineWidth',1)
plot(uy(:,1),uy(:,2),'b--','LineWidth',1)
legend({'DB20','MB20','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uy of point A','FontSize',10)
xlim([0 1.0])
ylim([-2 2])
set(gca,'XTick',(0:0.2:1.0))
set(gca,'YTick',(-2:1:2))
grid on
%% Ux of point A
hfig=figure;
plot(DB20(:,1),DB20(:,2),'k-','LineWidth',1)
hold on
plot(MB20(:,1),MB20(:,2),'r--','LineWidth',1)
plot(ux(:,1),ux(:,2),'b--','LineWidth',1)
legend({'DB20','MB20','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Ux of point A','FontSize',10)
xlim([0 1.0])
ylim([-5 0])
set(gca,'XTick',(0:0.2:1.0))
set(gca,'YTick',(-5:1:0))
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