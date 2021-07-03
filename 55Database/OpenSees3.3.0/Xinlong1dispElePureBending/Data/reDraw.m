clear;clc;
OODB5=load('OriOPSDispEnd4LayerFz5ele.out');
OODB40=load('OriOPSDispEnd8LayerFz40ele.out');
DBAsym5stp1=load('dispDBAsym5stp1.out');
DBAsym5stp2=load('dispDBAsym5stp2.out');
DB5stp1=load('dispDB5stp1.out');
DB5stp2=load('dispDB5stp2.out');
FB5stp1=load('dispFB5stp1.out');
FB5stp2=load('dispFB5stp2.out');
EB5stp1=load('dispEB5stp1.out');
EB5stp2=load('dispEB5stp2.out');
%% plot Fz vs disp. z
hfig=figure;
plot(OODB5(1:15000,4),OODB5(1:15000,1),'k-.','LineWidth',1)
hold on
plot(OODB40(1:15000,4),OODB40(1:15000,1),'k-','LineWidth',1)

plot(DBAsym5stp1(:,4),DBAsym5stp1(:,1),'r-','LineWidth',1);
plot(DB5stp1(:,4),DB5stp1(:,1),'b-','LineWidth',1);
plot(FB5stp1(:,4),FB5stp1(:,1),'m-','LineWidth',1);
plot(EB5stp1(:,4),EB5stp1(:,1),'g-','LineWidth',1);

% plot(DBAsym5stp2(:,4),DBAsym5stp2(:,1),'r--','LineWidth',1);
% plot(DB5stp2(:,4),DB5stp2(:,1),'b--','LineWidth',1);
% plot(FB5stp2(:,4),FB5stp2(:,1),'m--','LineWidth',1);
plot(EB5stp2(:,4),EB5stp2(:,1),'g--','LineWidth',1);

legend({'DB5-original element','DB40-original element','DBAsym5stp1','DB5stp1',...
    'FB5stp1','EB5stp1','EB5stp2'},'FontSize',10)
% legend({'DB5-original element','DB40-original element','DBAsym5stp1','DBAsym5stp2',...
%     'DB5stp1','DB5stp2','FB5stp1','FB5stp2','EB5stp1','EB5stp2'},'FontSize',10)
legend('Location','west')
% xlim([100 250])
% ylim([0 100])
set(gca,'XTick',(100:50:250),'YTick',(0:25:100))
set(gca,'FontSize',10)
xlabel('Lateral displacement (mm)','FontSize',10) 
ylabel('Load P (N)','FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');