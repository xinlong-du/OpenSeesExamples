clear;clc;
DispMidFx=load('DispMidFxImperf.out');
DispMidFx10len=load('DispMidFxImperf10len.out');
Battini = csvread('Battini.csv');
%% plot u and v vs. lateral force
figure
plot(DispMidFx(:,5),DispMidFx(:,1))
hold on
plot(Battini(:,1),Battini(:,2))
plot(DispMidFx10len(:,5),DispMidFx10len(:,1))
legend('DB20-Fx-len100','Battini-shell','DB20-Fx-len10')
xlabel('rad') 
ylabel('N')
set(gca,'YTick',(0:20:700))
grid on