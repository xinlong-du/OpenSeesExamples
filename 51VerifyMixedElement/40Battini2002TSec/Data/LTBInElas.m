clear;clc;
LTBInElasDispEndF0=load('LTBInElasDispEndF0.out');
LTBInElasDispEndF0001P=load('LTBInElasDispEndF0001P.out');
LTBInElasDispEndF0001PDB30layer8=load('LTBInElasDispEndF0001PDB30layer8.out');
%% vertical disp
figure
plot(LTBInElasDispEndF0(:,4),LTBInElasDispEndF0(:,1))
hold on
plot(LTBInElasDispEndF0001P(:,4),LTBInElasDispEndF0001P(:,1))
plot(LTBInElasDispEndF0001PDB30layer8(:,4),LTBInElasDispEndF0001PDB30layer8(:,1))
grid on
title('Vertical disp of O vs. P')
xlabel('disp') 
ylabel('P/100')
legend('F=0','F=P/1000DB30','F=P/1000DB30layer8')
ylim([30 40])
%% lateral disp
figure
plot(LTBInElasDispEndF0(:,3),LTBInElasDispEndF0(:,1))
hold on
plot(LTBInElasDispEndF0001P(:,3),LTBInElasDispEndF0001P(:,1))
plot(LTBInElasDispEndF0001PDB30layer8(:,3),LTBInElasDispEndF0001PDB30layer8(:,1))
grid on
title('Lateral disp of O vs. P')
xlabel('disp') 
ylabel('P/100')
legend('F=0','F=P/1000DB30','F=P/1000DB30layer8')
ylim([30 40])