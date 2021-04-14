%% plot Pc/PY vs Lambda
hfig=figure;
Kitipornchai = csvread('Kitipornchai.csv');
x=      [0.4 0.6   0.8   1.2   1.6   2.0];
y=     [0.91 0.841 0.755 0.582 0.335 0.223];
plot(x,y,'ko','LineWidth',1)
hold on
plot(Kitipornchai(:,1),Kitipornchai(:,2),'k-','LineWidth',1)
xlim([0 2.0])
ylim([0 1.6])
set(gca,'YTick',(0:0.2:1.6))
set(gca,'XTick',(0:0.4:2.0))
set(gca,'FontSize',10)
xlabel('Modified Slenderness','FontSize',10) 
ylabel('Buckling Load, Pc/Py','FontSize',10)
legend({'DB20','Kitipornchai and Lee [49]'},'FontSize',10)
legend('Location','northeast')

% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2DB.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');