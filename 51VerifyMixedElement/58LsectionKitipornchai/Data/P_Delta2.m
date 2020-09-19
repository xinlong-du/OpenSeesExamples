clear;clc;
DB20=load('SA12aMidNorm.out');
% AlSayed=csvread('AlSayed.csv');
%% plot
figure
plot(DB20(11:end,5),DB20(11:end,1),'k-','LineWidth',1.0)
% legend('DB20NoResiStress','DB20StandardResiStress','DB20MeasuredResiStress','AlSayed')
xlim([0 0.05])
% ylim([0 0.4])
% xlabel('rad') 
% ylabel('P/Py')
max(DB20(11:end,1))