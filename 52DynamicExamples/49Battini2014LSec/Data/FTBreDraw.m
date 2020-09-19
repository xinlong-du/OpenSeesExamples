clear;clc;
shearCenterDB40=load('DB40.out');
shearCenterMB40=load('MB40.out');
shearCenterDB40offset=load('shearCenterDB40offset.out');
centroidDB40=load('centroidDB40.out');
centroidDB40Step6400=load('centroidDB40rigidOffset6400Step.out');
centroidDB80Step6400=load('centroidDB80rigidOffset6400Step.out');
centroidMB80Step6400=load('centroidMB80rigidOffset6400Step.out');
uz = csvread('Uz.csv');
uy = csvread('Uy.csv');
%% plot Uz
figure
% plot(shearCenterDB40(:,1),shearCenterDB40(:,4),'k-','LineWidth',1.0)
% hold on
% plot(shearCenterMB40(:,1),shearCenterMB40(:,4),'r--','LineWidth',1.0)
% plot(shearCenterDB40offset(:,1),shearCenterDB40offset(:,4),'b--','LineWidth',1.0)
plot(centroidDB40(:,1),centroidDB40(:,4),'b-','LineWidth',1.0)
hold on
plot(centroidDB40Step6400(:,1),centroidDB40Step6400(:,4),'b--','LineWidth',1.0)
plot(centroidDB80Step6400(:,1),centroidDB80Step6400(:,4),'r--','LineWidth',1.0)
plot(centroidMB80Step6400(:,1),centroidMB80Step6400(:,4),'g--','LineWidth',1.0)
plot(uz(:,1),uz(:,2),'k-.','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
xlim([0 8])
ylim([-0.8 0.6])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-0.8:0.2:0.6))
grid on
% legend({'shearCenterDB40','shearCenterMB40','shearCenterDB40offset','centroidDB40',...
%     'centroidDB40Step6400','centroidDB80Step6400','centroidMB80Step6400','Abaqus'},'FontSize',6)
legend({'centroidDB40',...
    'centroidDB40Step6400','centroidDB80Step6400','centroidMB80Step6400','Abaqus'},'FontSize',10)
legend('Location','southwest')
%% plot Uy
figure
% plot(shearCenterDB40(:,1),shearCenterDB40(:,3),'k-','LineWidth',1.0)
% hold on
% plot(shearCenterMB40(:,1),shearCenterMB40(:,3),'r--','LineWidth',1.0)
% plot(shearCenterDB40offset(:,1),shearCenterDB40offset(:,3),'b--','LineWidth',1.0)
plot(centroidDB40(:,1),centroidDB40(:,3),'b-','LineWidth',1.0)
hold on
plot(centroidDB40Step6400(:,1),centroidDB40Step6400(:,3),'b--','LineWidth',1.0)
plot(centroidDB80Step6400(:,1),centroidDB80Step6400(:,3),'r--','LineWidth',1.0)
plot(centroidMB80Step6400(:,1),centroidMB80Step6400(:,3),'g--','LineWidth',1.0)
plot(uy(:,1),uy(:,2),'k-.','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
xlim([0 8])
ylim([-1.2 1.2])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-1.2:0.4:1.2))
grid on
% legend({'shearCenterDB40','shearCenterMB40','shearCenterDB40offset','centroidDB40',...
%     'centroidDB40Step6400','centroidDB80Step6400','centroidMB80Step6400','Abaqus'},'FontSize',6)
legend({'centroidDB40',...
    'centroidDB40Step6400','centroidDB80Step6400','centroidMB80Step6400','Abaqus'},'FontSize',10)
legend('Location','southwest')
%% plot Ux
figure
plot(shearCenterDB40(:,1),shearCenterDB40(:,2),'k-','LineWidth',1.0)
hold on
plot(shearCenterMB40(:,1),shearCenterMB40(:,2),'r--','LineWidth',1.0)
plot(shearCenterDB40offset(:,1),shearCenterDB40offset(:,2),'b--','LineWidth',1.0)
plot(centroidDB40(:,1),centroidDB40(:,2),'g-','LineWidth',1.0)
plot(centroidDB40Step6400(:,1),centroidDB40Step6400(:,2),'g--','LineWidth',1.0)
plot(centroidDB80Step6400(:,1),centroidDB80Step6400(:,2),'y-','LineWidth',1.0)
plot(centroidMB80Step6400(:,1),centroidMB80Step6400(:,2),'m-','LineWidth',1.0)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
xlim([0 8])
ylim([-0.8 0.6])
set(gca,'XTick',(0:2:8))
set(gca,'YTick',(-0.8:0.2:0.6))
grid on
legend({'shearCenterDB40','shearCenterMB40','shearCenterDB40offset','centroidDB40',...
    'centroidDB40Step6400','centroidDB80Step6400','centroidMB80Step6400'},'FontSize',6)
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