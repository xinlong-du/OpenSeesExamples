clear;clc;
DispEnd4LayerFz=load('dispDispEnd4LayerFz.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd8LayerFzOO40ele=load('OriOPSDispEnd8LayerFz40ele.out');
DispEnd4LayerFzDB1=load('dispDispEnd4LayerFzDB1.out');
DispEnd4LayerFzDB2=load('dispDispEnd4LayerFzDB2.out');
DispEnd4LayerFzDB3=load('dispDispEnd4LayerFzDB3.out');

%% plot Fz vs disp. z
hfig=figure;
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1),'k-.','LineWidth',1)
hold on
plot(DispEnd8LayerFzOO40ele(1:15000,4),DispEnd8LayerFzOO40ele(1:15000,1),'k-','LineWidth',1)
plot(DispEnd4LayerFzDB1(:,4),DispEnd4LayerFzDB1(:,1),'r:','LineWidth',1);
%plot(DispEnd4LayerFzDB2(:,4),DispEnd4LayerFzDB2(:,1),'r--','LineWidth',1);
plot(DispEnd4LayerFzDB3(:,4),DispEnd4LayerFzDB3(:,1),'r-.','LineWidth',1);
plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1),'r--','LineWidth',1);

legend({'DB5-OriginalElement','DB40-OriginalElement',...
    'DB1-WithoutLocking','DB3-WithoutLocking','DB5-WithoutLocking'},'FontSize',10)
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