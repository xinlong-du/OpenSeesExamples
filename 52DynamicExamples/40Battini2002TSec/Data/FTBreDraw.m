clear;clc;
MB40=load('MB40.out');
DB40=load('DB40.out');
DB40Centroid=load('DB40Centroid.out');

DB40EndNode=load('DB40EndNode.out');
DB40EndNodeRigid=load('DB40EndNodeRigid.out');
DB80EndNodeRigid=load('DB80EndNodeRigid.out');
MB80EndNodeRigid=load('MB80EndNodeRigid.out');
DB40EndNodeRigidHsiaoSC=load('DB40EndNodeRigidHsiaoSC.out');
DB80EndNodeRigidBattini=load('DB80EndNodeRigidBattini.out');

uy = csvread('BattiniUy.csv');
ux = csvread('BattiniUx.csv');
uz = csvread('BattiniUz.csv');
%% plot Uy
figure
% plot(DB40(:,1),-DB40(:,4),'k-','LineWidth',1.5)
% hold on
% plot(MB40(:,1),-MB40(:,4),'r--','LineWidth',1.5)
% plot(DB40Centroid(:,1),-DB40Centroid(:,4),'b--','LineWidth',1.5)
plot(DB40EndNode(:,1),-DB40EndNode(:,4),'g-','LineWidth',1.5)
hold on
plot(DB40EndNodeRigid(:,1),-DB40EndNodeRigid(:,4),'y--','LineWidth',1.5)
plot(DB80EndNodeRigid(:,1),-DB80EndNodeRigid(:,4),'r--','LineWidth',1.5)
plot(MB80EndNodeRigid(:,1),-MB80EndNodeRigid(:,4),'b--','LineWidth',1.5)
plot(DB40EndNodeRigidHsiaoSC(:,1),-DB40EndNodeRigidHsiaoSC(:,4),'c--','LineWidth',1.5)
plot(DB80EndNodeRigidBattini(:,1),DB80EndNodeRigidBattini(:,3),'m--','LineWidth',1.5)
plot(uy(:,1),uy(:,2),'k-.','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
xlim([0 2])
ylim([-1 0])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-1:0.2:0))
grid on
% legend('DB40','MB40','DB40offset','DB40changeReferenceLine','DB40changeReferenceLineRigid','Battini')
legend({'DB40centroidalOffset','DB40centroidalRigOffset','DB80centroidalRigOffset',...
    'MB80centroidalRigOffset','DB80centroidalRigOffsetHsiao','DB80centroidalRigOffsetNew','Battini'},'FontSize',6)
legend('Location','southwest')
%% Plot Ux
figure
% plot(DB40(:,1),DB40(:,2),'k-','LineWidth',1.5)
% hold on
% plot(MB40(:,1),MB40(:,2),'r--','LineWidth',1.5)
% plot(DB40Centroid(:,1),DB40Centroid(:,2),'b--','LineWidth',1.5)
plot(DB40EndNode(:,1),DB40EndNode(:,2),'g-','LineWidth',1.5)
hold on
plot(DB40EndNodeRigid(:,1),DB40EndNodeRigid(:,2),'y--','LineWidth',1.5)
plot(DB80EndNodeRigid(:,1),DB80EndNodeRigid(:,2),'r--','LineWidth',1.5)
plot(MB80EndNodeRigid(:,1),MB80EndNodeRigid(:,2),'b--','LineWidth',1.5)
plot(DB40EndNodeRigidHsiaoSC(:,1),DB40EndNodeRigidHsiaoSC(:,2),'c--','LineWidth',1.5)
plot(DB80EndNodeRigidBattini(:,1),DB80EndNodeRigidBattini(:,2),'m--','LineWidth',1.5)
plot(ux(:,1),ux(:,2),'k-.','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
xlim([0 2])
ylim([-0.18 0])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-0.2:0.04:0))
grid on
% legend('DB40','MB40','DB40offset','DB40changeReferenceLine','DB40changeReferenceLineRigid','Battini')
legend({'DB40centroidalOffset','DB40centroidalRigOffset','DB80centroidalRigOffset',...
    'MB80centroidalRigOffset','DB80centroidalRigOffsetHsiao','DB80centroidalRigOffsetNew','Battini'},'FontSize',6)
legend('Location','southwest')
%% Plot Uz
figure
% plot(DB40(:,1),DB40(:,3),'k-','LineWidth',1.5)
% hold on
% plot(MB40(:,1),MB40(:,3),'r--','LineWidth',1.5)
% plot(DB40Centroid(:,1),DB40Centroid(:,3),'b--','LineWidth',1.5)
plot(DB40EndNode(:,1),DB40EndNode(:,3),'g-','LineWidth',1.5)
hold on
plot(DB40EndNodeRigid(:,1),DB40EndNodeRigid(:,3),'y--','LineWidth',1.5)
plot(DB80EndNodeRigid(:,1),DB80EndNodeRigid(:,3),'r--','LineWidth',1.5)
plot(MB80EndNodeRigid(:,1),MB80EndNodeRigid(:,3),'b--','LineWidth',1.5)
plot(DB40EndNodeRigidHsiaoSC(:,1),DB40EndNodeRigidHsiaoSC(:,3),'c--','LineWidth',1.5)
plot(DB80EndNodeRigidBattini(:,1),DB80EndNodeRigidBattini(:,4),'m--','LineWidth',1.5)
plot(uz(:,1),uz(:,2),'k-.','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
xlim([0 2])
ylim([-0.4 1])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-0.4:0.2:1))
grid on
% legend('DB40','MB40','DB40offset','DB40changeReferenceLine','DB40changeReferenceLineRigid','Battini')
legend({'DB40centroidalOffset','DB40centroidalRigOffset','DB80centroidalRigOffset',...
    'MB80centroidalRigOffset','DB80centroidalRigOffsetHsiao','DB80centroidalRigOffsetNew','Battini'},'FontSize',6)
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