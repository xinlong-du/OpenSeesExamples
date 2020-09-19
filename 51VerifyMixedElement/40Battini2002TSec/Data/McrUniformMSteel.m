clear;clc;
L=[12000.0 9000.0 6000.0 3000.0 1200.0];
E=200000.0;
G=80000.0;
Iy=108972.0;
J=8424.0;
betax=38.7831;
% Mcr=3.14/L*sqrt(E*Iy*G*J)*(sqrt(1+1.27^2/L^2*E*Iy/G/J)+1.27/L*sqrt(E*Iy/G/J));%incorrect
% Mcr2=3.14/L*sqrt(E*Iy*G*J)*(sqrt(1+pi^2*274.5^2/4/L^2*E*Iy/G/J)+pi*274.5/2/L*sqrt(E*Iy/G/J));
% Mcr3=3.14/L*(E*Iy*G*J)^0.5*((1+pi^2*betax^2*E*Iy/4/G/J/L^2)^0.5+pi*betax/2/L*(E*Iy/G/J)^0.5);
Mcr=pi./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
%% L=600
% McrLTBDispMidL600DB30=load('McrLTBDispMidL600DB30.out');
% figure
% plot(McrLTBDispMidL600DB30(11:end,4),McrLTBDispMidL600DB30(11:end,1))
% title('L=600')
% xlabel('z-disp/L') 
% ylabel('M/1000000')
% ylim([0 20])
% set(gca,'YTick',(0:2:20))
% grid on
%% L=1200
McrLTBDispMidL1200DB30Steel=load('McrLTBDispMidDB30Steel.out');
figure
plot(McrLTBDispMidL1200DB30Steel(11:end,3),McrLTBDispMidL1200DB30Steel(11:end,1))
legend('DB30Steel')
title('L=1200')
xlabel('y-disp/L') 
ylabel('M/1000000')
ylim([0 20])
set(gca,'YTick',(0:2:20))
grid on
% %% L=1800
% McrLTBDispMidL1800DB30=load('McrLTBDispMidL1800DB30.out');
% figure
% plot(McrLTBDispMidL1800DB30(11:end,4),McrLTBDispMidL1800DB30(11:end,1))
% title('L=1800')
% xlabel('z-disp/L') 
% ylabel('M/1000000')
% ylim([0 10])
% set(gca,'YTick',(0:1:10))
% grid on
% %% L=2400
% McrLTBDispMidL2400DB30=load('McrLTBDispMidL2400DB30.out');
% figure
% plot(McrLTBDispMidL2400DB30(11:end,3),McrLTBDispMidL2400DB30(11:end,1))
% title('L=2400')
% xlabel('z-disp/L') 
% ylabel('M/1000000')
% ylim([0 10])
% set(gca,'YTick',(0:1:10))
% grid on
%% L=3000
McrLTBDispMidL3000DB30Steel=load('McrLTBDispMid3000DB30Steel.out');
McrLTBDispMidL3000DB30layer8Steel=load('McrLTBDispMidL3000DB30layer8Steel.out');
McrLTBDispMidL3000DB60layer8Steel=load('McrLTBDispMidL3000DB60layer8Steel.out');
figure
plot(McrLTBDispMidL3000DB30Steel(11:end,3),McrLTBDispMidL3000DB30Steel(11:end,1))
hold on
plot(McrLTBDispMidL3000DB30layer8Steel(11:end,3),McrLTBDispMidL3000DB30layer8Steel(11:end,1))
plot(McrLTBDispMidL3000DB60layer8Steel(11:end,3),McrLTBDispMidL3000DB60layer8Steel(11:end,1))
legend('DB30Steel','DB30layer8Steel','DB60layer8Steel')
title('L=3000')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 10])
set(gca,'YTick',(0:0.5:10))
grid on
%% compared to the theoretic results, my result for L=600 is smaller, but all other results are larger