clear;clc;
%% Elastic
ElasDB10=load('LeeFrameElasDB10.out');
ElasDB20=load('LeeFrameElasDB20.out');
ElasDB40=load('LeeFrameElasDB40.out');
deSouzaElas = csvread('deSouzaElas.csv');
figure
plot(-ElasDB10(:,3)/10,ElasDB10(:,1))
legend('ElasDB10')
xlabel('v (cm)') 
ylabel('P (kN)')
grid on
hfig=figure;
plot(-ElasDB20(:,3)/10,ElasDB20(:,1),'k--','LineWidth',1)
hold on
plot(-ElasDB40(:,3)/10,ElasDB40(:,1),'k-','LineWidth',1)
plot(deSouzaElas(:,1),deSouzaElas(:,2),'ko','LineWidth',1)
legend({'DB20-with locking','DB40-with locking','de Souza'},'FontSize',10)
legend('Location','west')
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
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% Inelastic
InElasDB40=load('LeeFrameInElasDB40.out');
InElasDB20=load('LeeFrameInElasDB20.out');
deSouzaInElas = csvread('deSouzaInElas.csv');
hfig=figure;
plot(-InElasDB20(:,3)/10,InElasDB20(:,1),'k--','LineWidth',1)
hold on
plot(-InElasDB40(:,3)/10,InElasDB40(:,1),'k-','LineWidth',1)
plot(deSouzaInElas(:,1),deSouzaInElas(:,2),'ko','LineWidth',1)
legend({'DB20-with locking','DB40-with locking','de Souza'},'FontSize',10)
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
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');