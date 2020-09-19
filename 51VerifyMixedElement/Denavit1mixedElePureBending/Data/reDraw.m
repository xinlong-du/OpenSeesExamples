clear;clc;
DispEnd4LayerFz=load('DispEnd4LayerFz.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd8LayerFzOO40ele=load('OriOPSDispEnd8LayerFz40ele.out');

%% plot Fz vs disp. z
hfig=figure;
plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1),'k--','LineWidth',1);
hold on
% plot(DispEnd8LayerFz(1:15000,4),DispEnd8LayerFz(1:15000,1))
% plot(DispEnd8LayerFz10ele(1:15000,4),DispEnd8LayerFz10ele(1:15000,1))
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1),'k-.','LineWidth',1)
plot(DispEnd8LayerFzOO40ele(1:15000,4),DispEnd8LayerFzOO40ele(1:15000,1),'k-','LineWidth',1)

legend({'DB5-mixedElement','DB5-OriginalElement','DB40-OriginalElement'},'FontSize',10)
legend('Location','west')
xlim([0 250])
ylim([0 150])
set(gca,'XTick',(0:50:250),'YTick',(0:50:150))
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