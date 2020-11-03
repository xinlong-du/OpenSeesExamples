clear;clc;
mixedDispM0DB2layer2t0794=load('mixedCantileverDispM0DB2layer2t0794.out');
mixedDispM0DB2layer2t0794M=load('mixedCantileverDispM0DB2layer2t0794-.out');

mixedDispM2440DB2layer2t0794=load('mixedCantileverDispM2440DB2layer2t0794.out');
mixedDispM2440DB2layer2t0794M=load('mixedCantileverDispM2440DB2layer2t0794-.out');

mixedDispM4890DB2layer2t0794=load('mixedCantileverDispM4890DB2layer2t0794.out');
mixedDispM4890DB2layer2t0794M=load('mixedCantileverDispM4890DB2layer2t0794-.out');

mixedDispM7340DB2layer2t0794=load('mixedCantileverDispM7340DB2layer2t0794.out');
mixedDispM7340DB2layer2t0794M=load('mixedCantileverDispM7340DB2layer2t0794-.out');

mixedDispM8560DB2layer2t0794=load('mixedCantileverDispM8560DB2layer2t0794.out');
mixedDispM8560DB2layer2t0794M=load('mixedCantileverDispM8560DB2layer2t0794-.out');

mixedDispM9780DB2layer2t0794=load('mixedCantileverDispM9780DB2layer2t0794.out');
mixedDispM9780DB2layer2t0794M=load('mixedCantileverDispM9780DB2layer2t0794-.out');

mixedDispM11000DB2layer2t0794=load('mixedCantileverDispM11000DB2layer2t0794.out');
mixedDispM11000DB2layer2t0794M=load('mixedCantileverDispM11000DB2layer2t0794-.out');


mixedDispM0DB20layer2t0794=load('mixedCantileverDispM0DB20layer2t0794.out');
mixedDispM0DB20layer2t0794M=load('mixedCantileverDispM0DB20layer2t0794-.out');

mixedDispM2440DB20layer2t0794=load('mixedCantileverDispM2440DB20layer2t0794.out');
mixedDispM2440DB20layer2t0794M=load('mixedCantileverDispM2440DB20layer2t0794-.out');

mixedDispM4890DB20layer2t0794=load('mixedCantileverDispM4890DB20layer2t0794.out');
mixedDispM4890DB20layer2t0794M=load('mixedCantileverDispM4890DB20layer2t0794-.out');

mixedDispM7340DB20layer2t0794=load('mixedCantileverDispM7340DB20layer2t0794.out');
mixedDispM7340DB20layer2t0794M=load('mixedCantileverDispM7340DB20layer2t0794-.out');

mixedDispM8560DB20layer2t0794=load('mixedCantileverDispM8560DB20layer2t0794.out');
mixedDispM8560DB20layer2t0794M=load('mixedCantileverDispM8560DB20layer2t0794-.out');

mixedDispM9780DB20layer2t0794=load('mixedCantileverDispM9780DB20layer2t0794.out');
mixedDispM9780DB20layer2t0794M=load('mixedCantileverDispM9780DB20layer2t0794-.out');

mixedDispM11000DB20layer2t0794=load('mixedCantileverDispM11000DB20layer2t0794.out');
mixedDispM11000DB20layer2t0794M=load('mixedCantileverDispM11000DB20layer2t0794-.out');
Exp = csvread('Exp.csv');
%%
hfig=figure;
h1=plot(Exp(:,1),Exp(:,2),'ko','LineWidth',1);
hold on
h2=plot(mixedDispM0DB2layer2t0794(:,5),400*mixedDispM0DB2layer2t0794(:,1)+2000,'k-','LineWidth',1);
plot(mixedDispM0DB2layer2t0794M(:,5),-400*mixedDispM0DB2layer2t0794M(:,1)+2000,'k-','LineWidth',1)
plot(mixedDispM2440DB2layer2t0794(101:end,5),400*mixedDispM2440DB2layer2t0794(101:end,1)+1800,'k-','LineWidth',1)
plot(mixedDispM2440DB2layer2t0794M(101:end,5),-400*mixedDispM2440DB2layer2t0794M(101:end,1)+1800,'k-','LineWidth',1)
plot(mixedDispM4890DB2layer2t0794(101:end,5),400*mixedDispM4890DB2layer2t0794(101:end,1)+1600,'k-','LineWidth',1)
plot(mixedDispM4890DB2layer2t0794M(101:end,5),-400*mixedDispM4890DB2layer2t0794M(101:end,1)+1600,'k-','LineWidth',1)
plot(mixedDispM7340DB2layer2t0794(101:end,5),400*mixedDispM7340DB2layer2t0794(101:end,1)+1400,'k-','LineWidth',1)
plot(mixedDispM7340DB2layer2t0794M(101:end,5),-400*mixedDispM7340DB2layer2t0794M(101:end,1)+1400,'k-','LineWidth',1)
plot(mixedDispM8560DB2layer2t0794(101:end,5),400*mixedDispM8560DB2layer2t0794(101:end,1)+1200,'k-','LineWidth',1)
plot(mixedDispM8560DB2layer2t0794M(101:end,5),-400*mixedDispM8560DB2layer2t0794M(101:end,1)+1200,'k-','LineWidth',1)
plot(mixedDispM9780DB2layer2t0794(101:end,5),400*mixedDispM9780DB2layer2t0794(101:end,1)+1000,'k-','LineWidth',1)
plot(mixedDispM9780DB2layer2t0794M(101:end,5),-400*mixedDispM9780DB2layer2t0794M(101:end,1)+1000,'k-','LineWidth',1)
plot(mixedDispM11000DB2layer2t0794(101:end,5),400*mixedDispM11000DB2layer2t0794(101:end,1)+800,'k-','LineWidth',1)
plot(mixedDispM11000DB2layer2t0794M(101:end,5),-400*mixedDispM11000DB2layer2t0794M(101:end,1)+800,'k-','LineWidth',1)


h3=plot(mixedDispM0DB20layer2t0794(:,5),400*mixedDispM0DB20layer2t0794(:,1)+2000,'r--','LineWidth',1);
plot(mixedDispM0DB20layer2t0794M(:,5),-400*mixedDispM0DB20layer2t0794M(:,1)+2000,'r--','LineWidth',1)
plot(mixedDispM2440DB20layer2t0794(101:end,5),400*mixedDispM2440DB20layer2t0794(101:end,1)+1800,'r--','LineWidth',1)
plot(mixedDispM2440DB20layer2t0794M(101:end,5),-400*mixedDispM2440DB20layer2t0794M(101:end,1)+1800,'r--','LineWidth',1)
plot(mixedDispM4890DB20layer2t0794(101:end,5),400*mixedDispM4890DB20layer2t0794(101:end,1)+1600,'r--','LineWidth',1)
plot(mixedDispM4890DB20layer2t0794M(101:end,5),-400*mixedDispM4890DB20layer2t0794M(101:end,1)+1600,'r--','LineWidth',1)
plot(mixedDispM7340DB20layer2t0794(101:end,5),400*mixedDispM7340DB20layer2t0794(101:end,1)+1400,'r--','LineWidth',1)
plot(mixedDispM7340DB20layer2t0794M(101:end,5),-400*mixedDispM7340DB20layer2t0794M(101:end,1)+1400,'r--','LineWidth',1)
plot(mixedDispM8560DB20layer2t0794(101:end,5),400*mixedDispM8560DB20layer2t0794(101:end,1)+1200,'r--','LineWidth',1)
plot(mixedDispM8560DB20layer2t0794M(101:end,5),-400*mixedDispM8560DB20layer2t0794M(101:end,1)+1200,'r--','LineWidth',1)
plot(mixedDispM9780DB20layer2t0794(101:end,5),400*mixedDispM9780DB20layer2t0794(101:end,1)+1000,'r--','LineWidth',1)
plot(mixedDispM9780DB20layer2t0794M(101:end,5),-400*mixedDispM9780DB20layer2t0794M(101:end,1)+1000,'r--','LineWidth',1)
plot(mixedDispM11000DB20layer2t0794(101:end,5),400*mixedDispM11000DB20layer2t0794(101:end,1)+800,'r--','LineWidth',1)
plot(mixedDispM11000DB20layer2t0794M(101:end,5),-400*mixedDispM11000DB20layer2t0794M(101:end,1)+800,'r--','LineWidth',1)

legend([h1 h2 h3],{'Engel (exp.)','MB10','MB20'},'FontSize',10)
legend('Location','southeast')
xlabel('Twist (rad)','FontSize',10) 
ylabel('T (N-mm)','FontSize',10)
xlim([-0.4 0.4])
ylim([0 3000])
set(gca,'YTick',(0:200:3000))
set(gca,'YTicklabel',[])
set(gca,'XTick',(-0.4:0.1:0.4))
set(gca,'FontSize',10)
grid on
set(gca,'GridLineStyle','--','XColor','k','GridAlpha',0.5)

% save figure
figWidth=3;
figHeight=4;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');