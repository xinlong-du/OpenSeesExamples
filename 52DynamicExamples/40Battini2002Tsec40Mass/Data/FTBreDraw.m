clear;clc;
DB40=load('DB40.out');
DB80=load('DB80.out');
uy = csvread('BattiniUy.csv');
ux = csvread('BattiniUx.csv');
uz = csvread('BattiniUz.csv');
uxAba = csvread('abaSolidUx.csv');
uyAba = csvread('abaSolidUy.csv');
uzAba = csvread('abaSolidUz.csv');
%% plot Ux
figure
plot(ux(:,1),ux(:,2),'k--','LineWidth',1.5)
hold on
plot(uxAba(:,1),uxAba(:,2),'k-','LineWidth',1.5)
plot(DB40(:,1),DB40(:,2),'r--','LineWidth',1.5)
plot(DB80(:,1),DB80(:,2),'b--','LineWidth',1.5)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
xlim([0 2])
ylim([-0.18 0])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-0.2:0.04:0))
grid on
legend({'Battini','Abaqus solid','DB40','DB80'},'FontSize',10)
legend('Location','southwest')
%% plot Uy
figure
plot(uy(:,1),uy(:,2),'k--','LineWidth',1.5)
hold on
plot(uyAba(:,1),uyAba(:,2),'k-','LineWidth',1.5)
plot(DB40(:,1),DB40(:,3),'r--','LineWidth',1.5)
plot(DB80(:,1),DB80(:,3),'b--','LineWidth',1.5)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
xlim([0 2])
ylim([-1 0])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-1:0.2:0))
grid on
legend({'Battini','Abaqus solid','DB40','DB80'},'FontSize',10)
legend('Location','southwest')
%% plot Uz
figure
plot(uz(:,1),uz(:,2),'k--','LineWidth',1.5)
hold on
plot(uzAba(:,1),uzAba(:,2),'k-','LineWidth',1.5)
plot(DB40(:,1),DB40(:,4),'r--','LineWidth',1.5)
plot(DB80(:,1),DB80(:,4),'b--','LineWidth',1.5)

xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
xlim([0 2])
ylim([-0.4 1])
set(gca,'XTick',(0:0.5:2))
set(gca,'YTick',(-0.4:0.2:1))
grid on
legend({'Battini','Abaqus solid','DB40','DB80'},'FontSize',10)
legend('Location','southwest')