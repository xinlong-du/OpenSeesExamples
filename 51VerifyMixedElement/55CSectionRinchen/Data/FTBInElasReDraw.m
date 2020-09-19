clear;clc;
DB40=load('DB40Mid.out');
DB10Rinchen=load('DB10MidRinchen.out');
DB40Rinchen=load('DB40MidRinchen.out');
DB40RinchenNoImperf=load('DB40MidRinchenNoImperf.out');

MB40Rinchen=load('MB40MidRinchen.out');
%% plot lateral disp
hfig=figure;
plot(DB40(2:end,5),DB40(2:end,1),'k-','LineWidth',1.0)
hold on
plot(DB10Rinchen(2:end,5),DB10Rinchen(2:end,1),'r-','LineWidth',1.0)
plot(DB40Rinchen(2:end,5),DB40Rinchen(2:end,1),'b--','LineWidth',1.0)
plot(DB40RinchenNoImperf(2:end,5),DB40RinchenNoImperf(2:end,1),'b-','LineWidth',1.0)
plot(MB40Rinchen(2:end,5),MB40Rinchen(2:end,1),'g-','LineWidth',1.0)
legend({'DB40','DB10Rinchen','DB40Rinchen','DB40RinchenNoImperf','MB40Rinchen'},'FontSize',10)
legend('Location','southeast')
%%
hfig=figure;
plot(DB40(2:end,5),DB40(2:end,1),'k-','LineWidth',1.0)
hold on
plot(DB10Rinchen(2:end,5),DB10Rinchen(2:end,1),'r-','LineWidth',1.0)
plot(DB40Rinchen(2:end,5),DB40Rinchen(2:end,1),'b--','LineWidth',1.0)
plot(MB40Rinchen(2:end,5),MB40Rinchen(2:end,1),'g-','LineWidth',1.0)
legend({'DB40','DB10RoundCorner','DB40RoundCorner','MB40RoundCorner'},'FontSize',10)
legend('Location','southeast')
xlabel('twist (rad)','FontSize',10) 
ylabel('Load (kN)','FontSize',10)
set(gca,'YTick',(0:2.5:25))
% xlim([0 60])
% ylim([1 2.8])
% set(gca,'XTick',(0:10:60))
% set(gca,'YTick',(1:0.2:2.8))
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
% fileout=('test2.');
% print(hfig,[fileout,'tif'],'-r800','-dtiff');