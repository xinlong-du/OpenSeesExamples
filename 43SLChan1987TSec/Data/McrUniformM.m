clear;clc;
L=[12000.0 9000.0 6000.0 3000.0];
E=200000.0;
G=80000.0;
Iy=2817900.0;
J=71960.0;
betax=274.5;
% Mcr=3.14/L*sqrt(E*Iy*G*J)*(sqrt(1+1.27^2/L^2*E*Iy/G/J)+1.27/L*sqrt(E*Iy/G/J));%incorrect
% Mcr2=3.14/L*sqrt(E*Iy*G*J)*(sqrt(1+pi^2*274.5^2/4/L^2*E*Iy/G/J)+pi*274.5/2/L*sqrt(E*Iy/G/J));
% Mcr3=3.14/L*(E*Iy*G*J)^0.5*((1+pi^2*betax^2*E*Iy/4/G/J/L^2)^0.5+pi*betax/2/L*(E*Iy/G/J)^0.5);
Mcr=pi./L*(E*Iy*G*J)^0.5.*((1+pi^2*betax^2*E*Iy/4/G/J./L.^2).^0.5+pi*betax/2./L*(E*Iy/G/J)^0.5)
%% L=12m
McrLTBDispMid12mDB30=load('McrLTBDispMid12mDB30Fy5.out');
figure
plot(McrLTBDispMid12mDB30(11:end,4),McrLTBDispMid12mDB30(11:end,1))
legend('12mDB30')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 60])
set(gca,'YTick',(0:5:60))
grid on
%% L=9m
McrLTBDispMid9mDB30=load('McrLTBDispMid.out'); %%Fy=50
McrLTBDispMid9mDB30Fy5=load('McrLTBDispMid9mDB30Fy5.out');
McrLTBDispMid9mDB60=load('McrLTBDispMid9mDB60.out');
figure
%plot(McrLTBDispMid9mDB30(11:end,3),McrLTBDispMid9mDB30(11:end,1))
plot(McrLTBDispMid9mDB30Fy5(11:end,4),McrLTBDispMid9mDB30Fy5(11:end,1))
hold on
plot(McrLTBDispMid9mDB60(11:end,4),McrLTBDispMid9mDB60(11:end,1))
%legend('9mDB30','9mDB30Fy5','9mDB60')
legend('9mDB30Fy5','9mDB60')
xlabel('z-disp/L') 
ylabel('M/1000000')
% xlim([0 80])
ylim([0 60])
% set(gca,'XTick',(0:10:80))
set(gca,'YTick',(0:5:60))
grid on
%% L=6m
McrLTBDispMid6mDB30=load('McrLTBDispMid6mDB30Fy5.out');
figure
plot(McrLTBDispMid6mDB30(11:end,4),McrLTBDispMid6mDB30(11:end,1))
legend('6mDB30')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([0 60])
set(gca,'YTick',(0:5:60))
grid on
%% L=3m
McrLTBDispMid3mDB30=load('McrLTBDispMid3mDB30Fy50.out');
figure
plot(McrLTBDispMid3mDB30(11:end,4),McrLTBDispMid3mDB30(11:end,1))
legend('3mDB30')
xlabel('z-disp/L') 
ylabel('M/1000000')
ylim([100 200])
set(gca,'YTick',(100:10:200))
grid on
%% compared to the results of SL Chan, my results are smaller