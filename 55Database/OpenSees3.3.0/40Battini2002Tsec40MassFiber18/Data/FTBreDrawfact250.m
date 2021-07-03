clear;clc;
DB40stp1=load('fact250DB40stp1.out');
DB40stp2=load('fact250DB40stp2.out');
%% plot Ux
figure
plot(DB40stp1(:,1),DB40stp1(:,2),'k-','LineWidth',1.5)
hold on
plot(DB40stp2(:,1),DB40stp2(:,2),'r-','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Ux (m)','FontSize',10)
% xlim([0 2])
% ylim([-0.18 0])
% set(gca,'XTick',(0:0.5:2))
% set(gca,'YTick',(-0.2:0.04:0))
grid on
legend({'DB40stp1','DB40stp2'},'FontSize',10)
legend('Location','southwest')
%% plot Uy
figure
plot(DB40stp1(:,1),DB40stp1(:,3),'k-','LineWidth',1.5)
hold on
plot(DB40stp2(:,1),DB40stp2(:,3),'r-','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uy (m)','FontSize',10)
% xlim([0 2])
% ylim([-1 0])
% set(gca,'XTick',(0:0.5:2))
% set(gca,'YTick',(-1:0.2:0))
grid on
legend({'DB40stp1','DB40stp2'},'FontSize',10)
legend('Location','southwest')
%% plot Uz
figure
plot(DB40stp1(:,1),DB40stp1(:,4),'k-','LineWidth',1.5)
hold on
plot(DB40stp2(:,1),DB40stp2(:,4),'r-','LineWidth',1.5)
xlabel('t (s)','FontSize',10) 
ylabel('Displacement Uz (m)','FontSize',10)
% xlim([0 2])
% ylim([-0.4 1])
% set(gca,'XTick',(0:0.5:2))
% set(gca,'YTick',(-0.4:0.2:1))
grid on
legend({'DB40stp1','DB40stp2'},'FontSize',10)
legend('Location','southwest')