%% plot Pc/PY vs Lambda
hfig=figure;
SLChan = csvread('SLChan.csv');
Kitipornchai = csvread('KitipornchaiElas.csv');
x=      [0.4  0.8  0.9  1.0  1.2  1.6  2.0];
y=     [1.35 1.00 0.89 0.77 0.58 0.35 0.23];
plot(x,y,'ko','LineWidth',1)
hold on
%plot(SLChan(:,1),SLChan(:,2))
plot(Kitipornchai(:,1),Kitipornchai(:,2),'k-','LineWidth',1)
xlim([0 2.0])
ylim([0 1.6])
set(gca,'YTick',(0:0.2:1.6))
set(gca,'XTick',(0:0.4:2.0))
set(gca,'FontSize',10)
xlabel('Modified Slenderness','FontSize',10) 
ylabel('Buckling Load, Pc/Py','FontSize',10)
legend({'DB20','Kitipornchai and Lee [33]'},'FontSize',10)
legend('Location','southwest')

% save figure
figWidth=3.5;
figHeight=3.3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');