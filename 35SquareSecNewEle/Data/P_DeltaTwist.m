clear;clc;
DispEndFx=load('DispEndFx.out');
DispEndFxImperf=load('DispEndFxImperf.out');
OriOPSDispEndFx=load('OriOPSDispEndFx.out');
OriOPSDispEndFxImperf=load('OriOPSDispEndFxImperf.out');

%% plot u and v vs. lateral force
figure
plot(DispEndFx(:,5),10000*DispEndFx(:,1))
hold on
%plot(DispEndFxImperf(11:23230,5),10000*DispEndFxImperf(11:23230,1))
plot(DispEndFxImperf(11:22500,5),10000*DispEndFxImperf(11:22500,1))
plot(OriOPSDispEndFx(1:27000,5),10000*OriOPSDispEndFx(1:27000,1))
plot(OriOPSDispEndFxImperf(11:end,5),10000*OriOPSDispEndFxImperf(11:end,1))
legend('DB5-Fx','DB5-FxImperf','OriOPSDB5-Fx','OriOPSDB5-FxImperf')
xlabel('rad') 
ylabel('N')
