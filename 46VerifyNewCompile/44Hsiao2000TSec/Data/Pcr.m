clear;clc;
%% L=65
LTBDispEndL65=load('LTBDispEndL65DB40.out');
figure
plot(LTBDispEndL65(11:end,4),LTBDispEndL65(11:end,1))
legend('L65DB40')
xlabel('z-disp') 
ylabel('lb')
ylim([10 30])
set(gca,'YTick',(10:1:30))
grid on
%% L=50
LTBDispEndL50=load('LTBDispEndL50DB40.out');
figure
plot(LTBDispEndL50(11:end,4),LTBDispEndL50(11:end,1))
legend('L50DB40')
xlabel('z-disp') 
ylabel('lbs')
ylim([20 40])
set(gca,'YTick',(20:1:40))
grid on