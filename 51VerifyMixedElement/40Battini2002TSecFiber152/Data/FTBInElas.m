clear;clc;
FTBInElasv = csvread('FTBInElasv.csv');
FTBInElasl = csvread('FTBInElasl.csv');
FTBInElasDispMidF0001P=load('FTBInElasDispMidF0001P.out');

%% plot vertical disp
figure
plot(FTBInElasv(:,1),FTBInElasv(:,2))
hold on
plot(-FTBInElasDispMidF0001P(:,4),FTBInElasDispMidF0001P(:,1))

xlim([0 5])
ylim([1 2.8])
set(gca,'XTick',(0:1:5))
set(gca,'YTick',(1:0.2:2.8))
grid on
title('Vertical disp of O vs. P')
legend('Battini-F=P/1000','F=P/1000')
xlabel('disp') 
ylabel('P/10000')
%% plot lateral disp
figure
plot(FTBInElasl(:,1),FTBInElasl(:,2))
hold on
plot(FTBInElasDispMidF0001P(:,3),FTBInElasDispMidF0001P(:,1))

xlim([0 60])
ylim([1 2.8])
set(gca,'XTick',(0:10:60))
set(gca,'YTick',(1:0.2:2.8))
grid on
title('Lateral disp of O vs. P')
legend('F=P/1000')
legend('Battini-F=P/1000','F=P/1000')
xlabel('disp') 
ylabel('P/10000')