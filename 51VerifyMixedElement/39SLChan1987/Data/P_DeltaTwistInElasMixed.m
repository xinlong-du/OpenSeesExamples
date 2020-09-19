clear;clc;
L76x51x5InElasLambda04Mid20eleBC=load('mixedL76x51x5InElasLLambda04Mid20eleBC.out');
L76x51x5InElasLambda06Mid20ele=load('mixedL76x51x5InElasLambda06Mid20eleBC.out');
L76x51x5InElasLambda08Mid20eleBC=load('mixedL76x51x5InElasLambda08Mid20eleBC.out');
L76x51x5InElasLambda08Mid20ele=load('mixedL76x51x5InElasLambda08Mid20ele.out');
L76x51x5InElasLambda09Mid20eleBC=load('mixedL76x51x5InElasLambda09Mid20eleBC.out');
L76x51x5InElasLambda10Mid20eleBC=load('mixedL76x51x5InElasLambda10Mid20eleBC.out');
L76x51x5InElasLambda12Mid20eleBC=load('mixedL76x51x5InElasLambda12Mid20eleBC.out');
L76x51x5InElasLambda16Mid20eleBC=load('mixedL76x51x5InElasLambda16Mid20eleBC.out');
L76x51x5InElasLambda20Mid20eleBC=load('mixedL76x51x5InElasLambda20Mid20eleBC.out');
figure
plot(L76x51x5InElasLambda04Mid20eleBC(11:end,5),L76x51x5InElasLambda04Mid20eleBC(11:end,1))
hold on
plot(-L76x51x5InElasLambda06Mid20ele(11:end,5),L76x51x5InElasLambda06Mid20ele(11:end,1))
plot(-L76x51x5InElasLambda08Mid20eleBC(11:end,5),L76x51x5InElasLambda08Mid20eleBC(11:end,1),'k-')
plot(-L76x51x5InElasLambda08Mid20ele(11:end,5),L76x51x5InElasLambda08Mid20ele(11:end,1),'r--')
plot(-L76x51x5InElasLambda09Mid20eleBC(11:end,5),L76x51x5InElasLambda09Mid20eleBC(11:end,1))
plot(-L76x51x5InElasLambda10Mid20eleBC(11:end,5),L76x51x5InElasLambda10Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda12Mid20eleBC(11:end,5),L76x51x5InElasLambda12Mid20eleBC(11:end,1))
plot(-L76x51x5InElasLambda16Mid20eleBC(11:end,5),L76x51x5InElasLambda16Mid20eleBC(11:end,1))
plot(-L76x51x5InElasLambda20Mid20eleBC(11:end,5),L76x51x5InElasLambda20Mid20eleBC(11:end,1))
legend('InElas-Lambda0.4-DB20','InElas-Lambda0.6-DB20','InElas-Lambda0.8-DB20BC','InElas-Lambda0.8-DB20','InElas-Lambda0.9-DB20BC',...
    'InElas-Lambda1.0-DB20BC','InElas-Lambda1.2-DB20BC','InElas-Lambda1.6-DB20BC','InElas-Lambda2.0-DB20BC')
xlabel('rad') 
ylabel('Pc/PY')
ylim([0.1 1])
% xlim([-0.03 0.01])
set(gca,'YTick',(0.1:0.02:1))
grid on
%% plot Pc/PY vs Lambda
figure
Kitipornchai = csvread('Kitipornchai.csv');
Tests = csvread('test.csv');
x=[0.4  0.6  0.8  0.9  1.0  1.2  1.6  2.0];
y=[0.91 0.84 0.75 0.71 0.65 0.58 0.33 0.22];
plot(x,y,'o')
hold on
plot(Kitipornchai(:,1),Kitipornchai(:,2))
plot(Tests(:,1),Tests(:,2),'^')
xlabel('Modified Slenderness') 
ylabel('Pc/PY')
legend('DB20','Kitipornchai','Tests')
%%
figure
Kitipornchai = csvread('Kitipornchai.csv');
Tests = csvread('test.csv');
x=[0.4  0.6  0.8  1.2  1.6  2.0];
y=[0.91 0.84 0.75 0.58 0.33 0.22];
plot(x,y,'o','LineWidth',1.5)
hold on
plot(Kitipornchai(:,1),Kitipornchai(:,2),'k-','LineWidth',1.5)
plot(Tests(:,1),Tests(:,2),'^')
xlabel('Modified Slenderness') 
ylabel('Pc/PY')
legend('DB20','Kitipornchai','Tests')