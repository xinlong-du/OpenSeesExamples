clear;clc;
L=[50.0 65.0];
E=9445.0;
G=3766.0;
Iy=1/12*0.1236*1.239^3+1/12*(2.8292-0.1236)*0.0863^3;
J=1.385982e-3;
betax=0.9*(2.8292-0.1236/2);
Mcr=pi./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
%% L=50
McrLTBDispMidL50DB40=load('McrLTBDispMidL50DB40.out');
figure
plot(McrLTBDispMidL50DB40(11:end,4),McrLTBDispMidL50DB40(11:end,1))
legend('L50DB40')
xlabel('z-disp/L') 
ylabel('M')
ylim([1 4])
set(gca,'YTick',(1:0.1:4))
grid on
%% L=65
McrLTBDispMidL65DB40=load('McrLTBDispMidL65DB40.out');
figure
plot(McrLTBDispMidL65DB40(11:end,4),McrLTBDispMidL65DB40(11:end,1))
legend('L65DB40')
xlabel('z-disp/L') 
ylabel('M')
ylim([0 4])
set(gca,'YTick',(0:0.2:4))
grid on