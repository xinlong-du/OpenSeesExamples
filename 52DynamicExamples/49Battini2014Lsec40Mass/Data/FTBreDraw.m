clear;clc;
DB40=load('DB40.out');
DB80=load('DB80.out');
uz = csvread('Uz.csv');
uy = csvread('Uy.csv');
%% plot Uz
figure
plot(uz(:,1),uz(:,2),'k-','LineWidth',1.0)
hold on
plot(DB40(:,1),DB40(:,4),'r--','LineWidth',1.0)
plot(DB80(:,1),DB80(:,4),'b--','LineWidth',1.0)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
xlim([0 8])
ylim([-0.8 0.6])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-0.8:0.2:0.6))
grid on
legend({'Abaqus','DB40','DB80'},'FontSize',10)
legend('Location','southwest')
%% plot Uy
figure
plot(uy(:,1),uy(:,2),'k-','LineWidth',1.0)
hold on
plot(DB40(:,1),DB40(:,3),'r--','LineWidth',1.0)
plot(DB80(:,1),DB80(:,3),'b--','LineWidth',1.0)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
xlim([0 8])
ylim([-1.2 1.2])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-1.2:0.4:1.2))
grid on
legend({'Abaqus','DB40','DB80'},'FontSize',10)
legend('Location','southwest')
%% plot Ux
figure
plot(DB40(:,1),DB40(:,2),'r--','LineWidth',1.0)
hold on
plot(DB80(:,1),DB80(:,2),'b--','LineWidth',1.0)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
xlim([0 8])
ylim([-0.16 0.04])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-0.16:0.04:0.04))
grid on
legend({'DB40','DB80'},'FontSize',10)
legend('Location','southwest')
%% plot lateral disp
% hfig=figure;
% plot(FTBl(:,1),FTBl(:,2),'ko','LineWidth',0.5)
% hold on
% plot(FTBDispMidF0001PDB2(:,3),FTBDispMidF0001PDB2(:,1),'k--','LineWidth',1)
% plot(FTBDispMidF0001PDB4(:,3),FTBDispMidF0001PDB4(:,1),'k-.','LineWidth',1)
% plot(FTBDispMidF0001PDB8(:,3),FTBDispMidF0001PDB8(:,1),'k:','LineWidth',1)
% plot(FTBDispMidF0001PDB40(:,3),FTBDispMidF0001PDB40(:,1),'k-','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB2(:,3),mixedFTBDispMidF0001PMB2(:,1),'r-','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB4(:,3),mixedFTBDispMidF0001PMB4(:,1),'r-.','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB8(:,3),mixedFTBDispMidF0001PMB8(:,1),'r:','LineWidth',1)
% plot(mixedFTBDispMidF0001PMB40(:,3),mixedFTBDispMidF0001PMB40(:,1),'r--','LineWidth',1)
% xlim([0 300])
% ylim([7 10])
% set(gca,'XTick',(0:50:300))
% set(gca,'YTick',(7:0.5:10))
% set(gca,'FontSize',10)
% xlabel('z-displacement of point O','FontSize',10) 
% ylabel('Load P/1000','FontSize',10)
% legend({'Battini','DB2','DB4','DB8','DB40','MB2','MB4','MB8','MB40'},'FontSize',8)
% legend('Location','southeast')
% % save figure
% figWidth=3.5;
% figHeight=3;
% set(hfig,'PaperUnits','inches');
% set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
% fileout=('test1.');
% print(hfig,[fileout,'tif'],'-r800','-dtiff');