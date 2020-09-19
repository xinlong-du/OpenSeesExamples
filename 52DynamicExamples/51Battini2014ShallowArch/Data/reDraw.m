%% Elastic
clear;clc;
DB21=load('shallowArchDB21.out');
MB21=load('shallowArchMB21.out');
ux = csvread('ux.csv');
uy = csvread('uy.csv');
uz = csvread('uz.csv');
%% Uz of point A
hfig=figure;
plot(DB21(:,1),DB21(:,4),'k-','LineWidth',1)
hold on
plot(MB21(:,1),MB21(:,4),'r--','LineWidth',1)
plot(uz(:,1),uz(:,2),'b--','LineWidth',1)
legend({'DB20','MB20','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uz of point A','FontSize',10)
xlim([0 0.5])
ylim([-2 2])
set(gca,'XTick',(0:0.1:0.5))
set(gca,'YTick',(-2:1:2))
grid on
%% Uy of point A
hfig=figure;
plot(DB21(:,1),DB21(:,3),'k-','LineWidth',1)
hold on
plot(MB21(:,1),MB21(:,3),'r--','LineWidth',1)
plot(uy(:,1),uy(:,2),'b--','LineWidth',1)
legend({'DB21','MB21','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Uy of point A','FontSize',10)
xlim([0 0.5])
ylim([-2 0.5])
set(gca,'XTick',(0:0.1:0.5))
set(gca,'YTick',(-2:0.5:0.5))
grid on
%% Ux of point A
hfig=figure;
plot(DB21(:,1),DB21(:,2),'k-','LineWidth',1)
hold on
plot(MB21(:,1),MB21(:,2),'r--','LineWidth',1)
plot(ux(:,1),ux(:,2),'b--','LineWidth',1)
legend({'DB21','MB21','Battini'},'FontSize',10)
legend('Location','southwest')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. Ux of point A','FontSize',10)
xlim([0 0.5])
ylim([-0.2 0.4])
set(gca,'XTick',(0:0.1:0.5))
set(gca,'YTick',(-0.2:0.1:0.4))
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