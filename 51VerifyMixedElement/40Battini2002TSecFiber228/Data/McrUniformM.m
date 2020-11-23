clear;clc;
L=[600.0 1200.0 1800.0 2400.0 3000.0];
E=70000.0;
G=E/2/(1+0.33);
Iy=108972.0;
J=8424.0;
betax=38.7831;
% Mcr=pi/L*sqrt(E*Iy*G*J)*(sqrt(1+1.27^2/L^2*E*Iy/G/J)+1.27/L*sqrt(E*Iy/G/J)); %incorrect
% Mcr3=3.14/L*(E*Iy*G*J)^0.5*((1+pi^2*betax^2*E*Iy/4/G/J/L^2)^0.5+pi*betax/2/L*(E*Iy/G/J)^0.5);
Mcr=3.14./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
Mcr2=3.14./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
%% L=600
McrLTBDispMidL600DB30=load('McrLTBDispMidL600DB30.out');
figure
plot(McrLTBDispMidL600DB30(11:end,4),McrLTBDispMidL600DB30(11:end,1))
title('L=600')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 20])
set(gca,'YTick',(0:2:20))
grid on
%% L=1200
McrLTBDispMidL1200DB30=load('McrLTBDispMid.out');
McrLTBDispMidL1200DB30layer8=load('McrLTBDispMidDB30layer8.out');
McrLTBDispMidL1200DB60=load('McrLTBDispMidL1200DB60.out');
figure
plot(McrLTBDispMidL1200DB30(11:end,3),McrLTBDispMidL1200DB30(11:end,1))
hold on
plot(McrLTBDispMidL1200DB30layer8(11:1500,3),McrLTBDispMidL1200DB30layer8(11:1500,1))
plot(McrLTBDispMidL1200DB60(11:end,3),McrLTBDispMidL1200DB60(11:end,1))
legend('DB30','DB30layer8','DB60')
title('L=1200')
xlabel('y-disp/L') 
ylabel('M/1000000')
ylim([0 10])
set(gca,'YTick',(0:1:10))
grid on
%% L=1800
McrLTBDispMidL1800DB30=load('McrLTBDispMidL1800DB30.out');
figure
plot(McrLTBDispMidL1800DB30(11:end,4),McrLTBDispMidL1800DB30(11:end,1))
title('L=1800')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 10])
set(gca,'YTick',(0:1:10))
grid on
%% L=2400
McrLTBDispMidL2400DB30=load('McrLTBDispMidL2400DB30.out');
figure
plot(McrLTBDispMidL2400DB30(11:end,3),McrLTBDispMidL2400DB30(11:end,1))
title('L=2400')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 10])
set(gca,'YTick',(0:1:10))
grid on
%% L=3000
McrLTBDispMidL3000DB30=load('McrLTBDispMidL3000DB30.out');
figure
plot(McrLTBDispMidL3000DB30(11:end,4),McrLTBDispMidL3000DB30(11:end,1))
title('L=3000')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 5])
set(gca,'YTick',(0:0.5:10))
grid on
%% compared to the theoretic results, my result for L=600 is smaller, but all other results are larger