clear;clc;
DispEnd4LayerFz=load('DispEnd4LayerFz.out');
DispEnd8LayerFz=load('DispEnd8LayerFz.out');
DispEnd8LayerFz10ele=load('DispEnd8LayerFz10ele.out');
DispEnd8LayerFz20ele=load('DispEnd8LayerFz20ele.out');
DispEnd8LayerFz40ele=load('DispEnd8LayerFz40ele.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd4LayerFzOO10ele=load('DispEnd4LayerFzOriginOpenSees10ele.out');
DispEnd8LayerFzOO40ele=load('OriOPSDispEnd8LayerFz40ele.out');
YDispEnd8LayerFz40ele=load('YDispEnd8LayerFy40ele.out');

%% plot Fz vs disp. z
hfig=figure;
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1),'k-.','LineWidth',1)
hold on
%plot(DispEnd4LayerFzOO10ele(1:15000,4),DispEnd4LayerFzOO10ele(1:15000,1))
plot(DispEnd8LayerFzOO40ele(1:15000,4),DispEnd8LayerFzOO40ele(1:15000,1),'k-','LineWidth',1)
%plot(YDispEnd8LayerFz40ele(1:15000,3),YDispEnd8LayerFz40ele(1:15000,1),'.','MarkerIndices',(1:500:15000))

plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1),'k--','LineWidth',2)
%plot(DispEnd8LayerFz(1:15000,4),DispEnd8LayerFz(1:15000,1),'*','MarkerIndices',(1:500:15000))
%plot(DispEnd8LayerFz10ele(1:15000,4),DispEnd8LayerFz10ele(1:15000,1))
plot(DispEnd8LayerFz20ele(1:15000,4),DispEnd8LayerFz20ele(1:15000,1),'k:','LineWidth',1)
plot(DispEnd8LayerFz40ele(1:15000,4),DispEnd8LayerFz40ele(1:15000,1),'k--','LineWidth',1)

legend('DB5-original element','DB40-original element',...
    'DB5-with locking','DB20-with locking','DB40-with locking')
legend('Location','west')
xlim([0 250])
ylim([0 100])
set(gca,'XTick',(0:50:250),'YTick',(0:25:100))
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
