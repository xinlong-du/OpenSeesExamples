%% Elastic
clear;clc;
ElasDB3=load('LeeFrameElasDB3.out');
ElasDB4=load('LeeFrameElasDB4.out');
ElasDB5=load('LeeFrameElasDB5.out');
ElasDB10=load('LeeFrameElasDB10.out');
mixedElasMB3=load('mixedLeeFrameElasMB3.out');
mixedElasMB4=load('mixedLeeFrameElasMB4.out');
mixedElasMB5=load('mixedLeeFrameElasMB5.out');
mixedElasMB10=load('mixedLeeFrameElasDB10.out');
deSouzaElas = csvread('deSouzaElas.csv');
hfig=figure;
plot(deSouzaElas(:,1),deSouzaElas(:,2),'ko','LineWidth',1)
hold on
% plot(-ElasDB3(:,3)/10,ElasDB3(:,1),'k-.','LineWidth',0.5)
plot(-ElasDB4(:,3)/10,ElasDB4(:,1),'k--','LineWidth',1)
plot(-ElasDB5(:,3)/10,ElasDB5(:,1),'k-','LineWidth',1)
% plot(-ElasDB10(:,3)/10,ElasDB10(:,1),'k-','LineWidth',0.5)
% plot(-mixedElasMB3(:,3)/10,mixedElasMB3(:,1),'r-.','LineWidth',0.5)
% plot(-mixedElasMB4(:,3)/10,mixedElasMB4(:,1),'r--','LineWidth',1)
% plot(-mixedElasMB5(:,3)/10,mixedElasMB5(:,1),'r-','LineWidth',1)
% plot(-mixedElasMB10(:,3)/10,mixedElasMB10(:,1),'r-','LineWidth',0.5)

legend({'de Souza [41]','DB4','DB5'},'FontSize',10)
legend('Location','southwest')
xlabel('Displacement v (cm)','FontSize',10) 
ylabel('Applied load P (kN)','FontSize',10)
xlim([0 95])
ylim([-15 25])
set(gca,'XTick',(0:10:95))
set(gca,'YTick',(-15:10:25))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test3DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% Inelastic
InElasDB3=load('LeeFrameInElasDB3.out');
InElasDB4=load('LeeFrameInElasDB4.out');
InElasDB5=load('LeeFrameInElasDB5.out');
InElasDB10=load('LeeFrameInElasDB10.out');
mixedInElasMB3=load('mixedLeeFrameInElasMB3.out');
mixedInElasMB4=load('mixedLeeFrameInElasMB4.out');
mixedInElasMB5=load('mixedLeeFrameInElasMB5.out');
mixedInElasMB10=load('mixedLeeFrameInElasDB10.out');
deSouzaInElas = csvread('deSouzaInElas.csv');
hfig=figure;
plot(deSouzaInElas(:,1),deSouzaInElas(:,2),'ko','LineWidth',1)
hold on
% plot(-InElasDB3(1:end,3)/10,InElasDB3(1:end,1),'k-.','LineWidth',0.5)
plot(-InElasDB4(1:end,3)/10,InElasDB4(1:end,1),'k--','LineWidth',1)
plot(-InElasDB5(1:end,3)/10,InElasDB5(1:end,1),'k-','LineWidth',1)
% plot(-InElasDB10(1:end,3)/10,InElasDB10(1:end,1),'k-','LineWidth',0.5)
% plot(-mixedInElasMB3(1:end,3)/10,mixedInElasMB3(1:end,1),'r-.','LineWidth',0.5)
% plot(-mixedInElasMB4(1:end,3)/10,mixedInElasMB4(1:end,1),'r--','LineWidth',1)
% plot(-mixedInElasMB5(1:end,3)/10,mixedInElasMB5(1:end,1),'r-','LineWidth',1)
% plot(-mixedInElasMB10(1:end,3)/10,mixedInElasMB10(1:end,1),'r-','LineWidth',0.5)

legend({'de Souza [41]','DB4','DB5'},'FontSize',10)
legend('Location','southwest')
xlabel('Displacement v (cm)','FontSize',10) 
ylabel('Applied load P (kN)','FontSize',10)
xlim([0 80])
ylim([-5 20])
set(gca,'XTick',(0:10:80))
set(gca,'YTick',(-5:5:20))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test4DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');