clear;clc;
DispEnd4LayerFz=load('mixedDispEnd4LayerFz.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd8LayerFzOO40ele=load('OriOPSDispEnd8LayerFz40ele.out');
DispEnd4LayerFzMB1=load('mixedDispEnd4LayerFzMB1.out');
DispEnd4LayerFzMB2=load('mixedDispEnd4LayerFzMB2.out');
DispEnd4LayerFzMB3=load('mixedDispEnd4LayerFzMB3.out');

%% plot Fz vs disp. z
hfig=figure;
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1),'k-.','LineWidth',1)
hold on
plot(DispEnd8LayerFzOO40ele(1:13500,4),DispEnd8LayerFzOO40ele(1:13500,1),'k-','LineWidth',1)

%plot(DispEnd4LayerFzMB1(:,4),DispEnd4LayerFzMB1(:,1),'r:','LineWidth',1);
plot(DispEnd4LayerFzMB2(1:15000,4),DispEnd4LayerFzMB2(1:15000,1),'r--','LineWidth',1);
plot(DispEnd4LayerFzMB3(1:15000,4),DispEnd4LayerFzMB3(1:15000,1),'r-.','LineWidth',1);
plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1),'r--','LineWidth',1);

legend({'DB5-original element','DB40-original element','MB2','MB3','MB5'},'FontSize',10)
legend('Location','west')
xlim([100 250])
ylim([0 100])
set(gca,'XTick',(100:50:250),'YTick',(0:25:100))
set(gca,'FontSize',10)
xlabel('Lateral displacement (mm)','FontSize',10) 
ylabel('Load (N)','FontSize',10)

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');