clear;clc;
L76x51x5InElasLambda04Mid20eleBC=load('L76x51x5InElasLLambda04Mid20eleBC.out');
L76x51x5InElasLambda08Mid20eleBC=load('L76x51x5InElasLambda08Mid20eleBC.out');
L76x51x5InElasLambda08Mid20ele=load('L76x51x5InElasLambda08Mid20ele.out');
L76x51x5InElasLambda09Mid20eleBC=load('L76x51x5InElasLambda09Mid20eleBC.out');
L76x51x5InElasLambda10Mid20eleBC=load('L76x51x5InElasLambda10Mid20eleBC.out');
L76x51x5InElasLambda12Mid20eleBC=load('L76x51x5InElasLambda12Mid20eleBC.out');
L76x51x5InElasLambda16Mid20eleBC=load('L76x51x5InElasLambda16Mid20eleBC.out');
L76x51x5InElasLambda20Mid20eleBC=load('L76x51x5InElasLambda20Mid20eleBC.out');
figure
plot(L76x51x5InElasLambda04Mid20eleBC(11:end,5),L76x51x5InElasLambda04Mid20eleBC(11:end,1))
hold on
plot(L76x51x5InElasLambda08Mid20eleBC(11:end,5),L76x51x5InElasLambda08Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda08Mid20ele(11:1000,5),L76x51x5InElasLambda08Mid20ele(11:1000,1))
plot(L76x51x5InElasLambda09Mid20eleBC(11:end,5),L76x51x5InElasLambda09Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda10Mid20eleBC(11:end,5),L76x51x5InElasLambda10Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda12Mid20eleBC(11:end,5),L76x51x5InElasLambda12Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda16Mid20eleBC(11:end,5),L76x51x5InElasLambda16Mid20eleBC(11:end,1))
plot(L76x51x5InElasLambda20Mid20eleBC(11:end,5),L76x51x5InElasLambda20Mid20eleBC(11:end,1))
legend('InElas-Lambda0.4-DB20','InElas-Lambda0.8-DB20BC','InElas-Lambda0.8-DB20','InElas-Lambda0.9-DB20BC',...
    'InElas-Lambda1.0-DB20BC','InElas-Lambda1.2-DB20BC','InElas-Lambda1.6-DB20BC','InElas-Lambda2.0-DB20BC')
xlabel('rad') 
ylabel('Pc/PY')
ylim([0.1 1])
set(gca,'YTick',(0.1:0.02:1))
grid on
%% plot Pc/PY vs Lambda
figure
Kitipornchai = csvread('Kitipornchai.csv');
x=[0.4  0.8   0.9  1.0  1.2   1.6  2.0];
y=[0.96 0.948 0.87 0.77 0.584 0.35 0.23];
plot(x,y,'o')
hold on
plot(Kitipornchai(:,1),Kitipornchai(:,2))
xlabel('Modified Slenderness') 
ylabel('Pc/PY')
legend('DB20','Kitipornchai')