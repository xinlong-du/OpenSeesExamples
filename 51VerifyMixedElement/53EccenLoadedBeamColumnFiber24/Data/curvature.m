clear;clc;
%% 1 element
exact = csvread('exact.csv');
displ = csvread('displ.csv');
mixed = csvread('mixed.csv');

hfig=figure;
plot(exact(:,1),exact(:,2),'k-','LineWidth',1.0)
hold on
plot(displ(:,1),displ(:,2),'k--','LineWidth',1.0)
plot(mixed(:,1),mixed(:,2),'k-.','LineWidth',1.0)

legend({'Exact','DB1','MB1'},'FontSize',10)
legend('Location','northwest')
xlabel('x/L','FontSize',10) 
ylabel('Curvature','FontSize',10)
xlim([0 1])
ylim([0 0.0004])
set(gca,'XTick',(0:0.2:1))
set(gca,'YTick',(0:0.0001:0.0004))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% 2 elements
exact2 = csvread('exact2.csv');
displ2 = csvread('displ2.csv');
mixed2 = csvread('mixed2.csv');

hfig=figure;
plot(exact2(:,1),exact2(:,2),'k-','LineWidth',1.0)
hold on
plot(displ2(:,1),displ2(:,2),'ks--','LineWidth',1.0)
plot(mixed2(:,1),mixed2(:,2),'ko-.','LineWidth',1.0)

legend({'Exact','DB2','MB2'},'FontSize',10)
legend('Location','northwest')
xlabel('x/L','FontSize',10) 
ylabel('Curvature','FontSize',10)
xlim([0 1])
ylim([0 0.0004])
set(gca,'XTick',(0:0.2:1))
set(gca,'YTick',(0:0.0001:0.0004))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');