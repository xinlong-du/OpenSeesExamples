clear;clc;
LTBDispEnd=load('LTBDispEnd.out');
LTBDispEndF0=load('LTBDispEndF0.out');
LTBDispEndF0001P=load('LTBDispEndF0001P.out');
LTBDispEndF0001P60ele=load('LTBDispEndF0001P60ele.out');
LTBDispEndF0001P30ele8layer=load('LTBDispEndF0001P30ele8layer.out');
% LTBDispEndImperf=load('LTBDispEndImperf.out');
% LTBDispEndImperfTor=load('LTBDispEndImperfTor.out');
% LTBDispEndF0001Pz=load('LTBDispEndF0001P-z.out');
% LTBDispEndF0005P=load('LTBDispEndF0005P.out');
%% plot vertical disp
figure
plot(LTBDispEndF0(:,4),LTBDispEndF0(:,1))
hold on
plot(LTBDispEndF0001P(:,4),LTBDispEndF0001P(:,1))
plot(LTBDispEndF0001P60ele(:,4),LTBDispEndF0001P60ele(:,1))
plot(LTBDispEndF0001P30ele8layer(1:4000,4),LTBDispEndF0001P30ele8layer(1:4000,1))
% plot(LTBDispEndImperf(11:end,4),LTBDispEndImperf(11:end,1))
% plot(LTBDispEndImperfTor(11:end,4),LTBDispEndImperfTor(11:end,1),'o','MarkerIndices',1:5:460)
% plot(LTBDispEndF0001Pz(:,4),LTBDispEndF0001Pz(:,1))
% plot(LTBDispEndF0005P(:,4),LTBDispEndF0005P(:,1))
% legend('F=0','F=P/1000','F=P/1000DB60','Imperf','ImperfTor','F=P/1000-z','F=P/200')
legend('F=0','F=P/1000DB30','F=P/1000DB60','F=P/1000DB30layer8')
title('Vertical disp vs. P')
grid on
ylim([30 46])
%% plot lateral disp
figure
plot(LTBDispEndF0(:,3),LTBDispEndF0(:,1))
hold on
plot(LTBDispEndF0001P(:,3),LTBDispEndF0001P(:,1))
plot(LTBDispEndF0001P60ele(:,3),LTBDispEndF0001P60ele(:,1))
plot(LTBDispEndF0001P30ele8layer(1:4000,3),LTBDispEndF0001P30ele8layer(1:4000,1))
% plot(LTBDispEndImperf(11:end,3),LTBDispEndImperf(11:end,1))
% plot(LTBDispEndImperfTor(11:end,3),LTBDispEndImperfTor(11:end,1),'o','MarkerIndices',1:5:460)
% plot(LTBDispEndF0001Pz(:,3),LTBDispEndF0001Pz(:,1))
% plot(LTBDispEndF0005P(:,3),LTBDispEndF0005P(:,1))
% legend('F=0','F=P/1000','F=P/1000DB60','Imperf','ImperfTor','F=P/1000-z','F=P/200')
legend('F=0','F=P/1000DB30','F=P/1000DB60','F=P/1000DB30layer8')
title('Lateral disp vs. P')
grid on
ylim([30 46])