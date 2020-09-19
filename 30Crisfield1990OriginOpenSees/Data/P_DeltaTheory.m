clear;clc;
DispEnd=load('DispEnd.out');
DispEnd4Layer=load('DispEnd4Layer.out');
%M9039 = csvread('M9039.csv');
%% plot u and v vs. axial force
%% M=0
figure
plot(DispEnd(11:end,4),DispEnd(11:end,1))
hold on
plot(DispEnd4Layer(11:end,4),DispEnd4Layer(11:end,1))
legend('DB10','DB104Layer')
xlabel('mm') 
ylabel('N')