clear;clc;
DispM73ele20=load('DispM-73ele20.out');
DispM1028=load('DispM1028.out');
DispM2135ele20=load('DispM2135ele20.out');
DispM3231ele20=load('DispM3231ele20.out');
DispM4338ele20=load('DispM4338ele20.out');
DispM5445ele20=load('DispM5445ele20.out');
Goodier = csvread('Goodier.csv');

mixedDispM73ele20=load('mixedDispM-73ele20.out');
mixedDispM1028=load('mixedDispM1028.out');
mixedDispM2135ele20=load('mixedDispM2135ele20.out');
mixedDispM3231ele20=load('mixedDispM3231ele20.out');
mixedDispM4338ele20=load('mixedDispM4338ele20.out');
mixedDispM5445ele20=load('mixedDispM5445ele20.out');
%% plot u and v vs. axial force
hfig=figure;
p1=plot(Goodier(:,1),Goodier(:,2),'ko');
hold on
p2=plot(903.88/2/112.98*DispM73ele20(11:end,1),DispM73ele20(11:end,5)/18.4,'k-','LineWidth',1);
plot(903.88/2/112.98*DispM1028(11:end,1),DispM1028(11:end,5)/18.4,'k-','LineWidth',1)
plot(903.88/2/112.98*DispM2135ele20(11:end,1),DispM2135ele20(11:end,5)/18.4,'k-','LineWidth',1)
plot(903.88/2/112.98*DispM3231ele20(11:end,1),DispM3231ele20(11:end,5)/18.4,'k-','LineWidth',1)
plot(903.88/2/112.98*DispM4338ele20(11:end,1),DispM4338ele20(11:end,5)/18.4,'k-','LineWidth',1)
plot(903.88/2/112.98*DispM5445ele20(11:end,1),DispM5445ele20(11:end,5)/18.4,'k-','LineWidth',1)

p3=plot(903.88/2/112.98*mixedDispM73ele20(11:end,1),mixedDispM73ele20(11:end,5)/18.4,'r--','LineWidth',1);
plot(903.88/2/112.98*mixedDispM1028(11:end,1),mixedDispM1028(11:end,5)/18.4,'r--','LineWidth',1)
plot(903.88/2/112.98*mixedDispM2135ele20(11:end,1),mixedDispM2135ele20(11:end,5)/18.4,'r--','LineWidth',1)
plot(903.88/2/112.98*mixedDispM3231ele20(11:end,1),mixedDispM3231ele20(11:end,5)/18.4,'r--','LineWidth',1)
plot(903.88/2/112.98*mixedDispM4338ele20(11:end,1),mixedDispM4338ele20(11:end,5)/18.4,'r--','LineWidth',1)
plot(903.88/2/112.98*mixedDispM5445ele20(11:end,1),mixedDispM5445ele20(11:end,5)/18.4,'r--','LineWidth',1)
legend([p1 p2 p3],{'Engel (exp.)','DB20','MB20'},'FontSize',10);
legend('Location','southeast')
xlim([0 4.0])
ylim([0 0.03])
set(gca,'XTick',(0:1.0:4.0),'YTick',(0:0.01:0.03))
set(gca,'FontSize',10)
xlabel('Torque (lb-in)','FontSize',10) 
ylabel('Twist (rad/in)','FontSize',10)

% save figure
figWidth=4.0;
figHeight=2.5;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');