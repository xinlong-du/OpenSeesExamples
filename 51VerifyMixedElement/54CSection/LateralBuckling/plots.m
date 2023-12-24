close all;clear;clc;
capAISI=5.5; %length=262 in
CB_MzP=load('8CS2.5x059Mz262inP.out');
plot(CB_MzP(:,5),CB_MzP(:,1))
hold on
plot([-1 1],[capAISI capAISI],'k--','LineWidth',1)
% xlim([-1 1])
ylim([0 30])
% xticks(-1.5:0.25:1.5)
% yticks(0:2:20)
legend('Negative perturbation','Positive perturbation','AISI manual')
xlabel('Twist angle at midspan (rad)')
ylabel('Bending moment (kip-in)')