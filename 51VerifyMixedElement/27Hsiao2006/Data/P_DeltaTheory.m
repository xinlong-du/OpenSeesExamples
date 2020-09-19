clear;clc;
DispM9039=load('CantileverDispM9039.out');
DispM9039_=load('CantileverDispM9039-.out');
DispM11000=load('CantileverDispM11000rad2.out');
DispM11000_=load('CantileverDispM11000rad2-.out');
M9039 = csvread('M9039.csv');
%% plot u and v vs. axial force
%% M=0
figure
plot(DispM9039(101:end,5),400*DispM9039(101:end,1))
hold on
plot(DispM9039_(101:end,5),-400*DispM9039_(101:end,1))
% hold on
% plot(DispM11000(101:end,5),400*DispM11000(101:end,1))
% hold on
% plot(DispM11000_(101:end,5),-400*DispM11000_(101:end,1))
% hold on
plot(M9039(:,1),113*M9039(:,2))
%legend('M9039','M9039-','M11000','M11000-','M9039Theory')
legend('M9039','M9039-','M9039Theory')
xlabel('rad') 
ylabel('N-mm')