clear;clc;
L=[12000.0 9000.0 6000.0 3000.0];
E=200000.0;
G=80000.0;
Iy=2817900.0;
J=71960.0;
betax=274.5;
Mcr=pi./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
%% L=12m
McrLTBDispMid12mDB30=load('McrLTBDispMid12mDB30Fy5.out');
mixedMcrLTBDispMid12mDB30=load('mixedMcrLTBDispMid12mDB30Fy5.out');
mixedMcrLTBDispMid12mDB20=load('mixedMcrLTBDispMid12mDB20Fy5.out');
figure
plot(McrLTBDispMid12mDB30(11:end,4),McrLTBDispMid12mDB30(11:end,1),'k-','LineWidth',1)
hold on
plot(mixedMcrLTBDispMid12mDB30(11:end,4),mixedMcrLTBDispMid12mDB30(11:end,1),'r--','LineWidth',1)
plot(mixedMcrLTBDispMid12mDB20(11:end,4),mixedMcrLTBDispMid12mDB20(11:end,1),'b--','LineWidth',1)
legend('12mDB30','12mMB30','12mMB20')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 60])
set(gca,'YTick',(0:5:60))
grid on
%% L=9m
McrLTBDispMid9mDB30Fy5=load('McrLTBDispMid9mDB30Fy5.out');
mixedMcrLTBDispMid9mDB30Fy5=load('mixedMcrLTBDispMid9mDB30Fy5.out');
mixedMcrLTBDispMid9mDB20Fy5=load('mixedMcrLTBDispMid9mDB20Fy5.out');
figure
plot(McrLTBDispMid9mDB30Fy5(11:end,4),McrLTBDispMid9mDB30Fy5(11:end,1),'k-','LineWidth',1)
hold on
plot(mixedMcrLTBDispMid9mDB30Fy5(11:end,4),mixedMcrLTBDispMid9mDB30Fy5(11:end,1),'r--','LineWidth',1)
plot(mixedMcrLTBDispMid9mDB20Fy5(11:end,4),mixedMcrLTBDispMid9mDB20Fy5(11:end,1),'b--','LineWidth',1)
legend('9mDB30','9mMB30','9mMB20')
xlabel('z-disp/L') 
ylabel('M/1000000')
% xlim([0 80])
ylim([0 60])
% set(gca,'XTick',(0:10:80))
set(gca,'YTick',(0:5:60))
grid on
%% L=6m
McrLTBDispMid6mDB30=load('McrLTBDispMid6mDB30Fy5.out');
mixedMcrLTBDispMid6mDB30=load('mixedMcrLTBDispMid6mDB30Fy5.out');
mixedMcrLTBDispMid6mDB20=load('mixedMcrLTBDispMid6mDB2Fy5.out');
figure
plot(McrLTBDispMid6mDB30(11:end,4),McrLTBDispMid6mDB30(11:end,1),'k-','LineWidth',1)
hold on
plot(mixedMcrLTBDispMid6mDB30(11:end,4),mixedMcrLTBDispMid6mDB30(11:end,1),'r--','LineWidth',1)
plot(mixedMcrLTBDispMid6mDB20(11:end,4),mixedMcrLTBDispMid6mDB20(11:end,1),'b-.','LineWidth',1)
legend('6mDB30','6mMB30','6mMB20')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 60])
set(gca,'YTick',(0:2:60))
grid on
%% L=3m
McrLTBDispMid3mDB30=load('McrLTBDispMid3mDB30Fy50.out');
mixedMcrLTBDispMid3mDB30=load('mixedMcrLTBDispMid3mDB30Fy50.out');
figure
plot(McrLTBDispMid3mDB30(11:end,4),McrLTBDispMid3mDB30(11:end,1),'k-','LineWidth',1)
hold on
plot(mixedMcrLTBDispMid3mDB30(11:end,4),mixedMcrLTBDispMid3mDB30(11:end,1),'r--','LineWidth',1)
legend('3mDB30','3mMB30')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([100 200])
set(gca,'YTick',(100:10:200))
grid on
%% compared to the results of SL Chan, my results are smaller