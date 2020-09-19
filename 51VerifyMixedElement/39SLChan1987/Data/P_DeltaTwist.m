clear;clc;
L76x51x5Lambda04Mid20ele=load('L76x51x5Lambda04Mid20ele.out');
L76x51x5Lambda08Mid20ele=load('L76x51x5Lambda08Mid20ele.out');
L76x51x5Lambda09Mid20ele=load('L76x51x5Lambda09Mid20ele.out');
L76x51x5Lambda10Mid20ele=load('L76x51x5Lambda10Mid20ele.out');
L76x51x5Lambda12Mid20ele=load('L76x51x5Lambda12Mid20ele.out');
L76x51x5Lambda16Mid20ele=load('L76x51x5Lambda16Mid20ele.out');
L76x51x5Lambda20Mid20ele=load('L76x51x5Lambda20Mid20ele.out');

mixedL76x51x5Lambda04Mid20ele=load('mixedL76x51x5Lambda04Mid20ele.out');
mixedL76x51x5Lambda08Mid20ele=load('mixedL76x51x5Lambda08Mid20ele.out');
mixedL76x51x5Lambda09Mid20ele=load('mixedL76x51x5Lambda09Mid20ele.out');
mixedL76x51x5Lambda10Mid20ele=load('mixedL76x51x5Lambda10Mid20ele.out');
mixedL76x51x5Lambda12Mid20ele=load('mixedL76x51x5Lambda12Mid20ele.out');
mixedL76x51x5Lambda16Mid20ele=load('mixedL76x51x5Lambda16Mid20ele.out');
mixedL76x51x5Lambda20Mid20ele=load('mixedL76x51x5Lambda20Mid20ele.out');
%% plot Pc/PY vs twist
figure
plot(L76x51x5Lambda04Mid20ele(11:end,5),L76x51x5Lambda04Mid20ele(11:end,1),'k')
hold on
plot(L76x51x5Lambda08Mid20ele(11:end,5),L76x51x5Lambda08Mid20ele(11:end,1),'k')
plot(L76x51x5Lambda09Mid20ele(11:end,5),L76x51x5Lambda09Mid20ele(11:end,1),'k')
plot(L76x51x5Lambda10Mid20ele(11:end,5),L76x51x5Lambda10Mid20ele(11:end,1),'k')
plot(L76x51x5Lambda12Mid20ele(11:end,5),L76x51x5Lambda12Mid20ele(11:end,1),'k')
plot(L76x51x5Lambda16Mid20ele(11:end,5),L76x51x5Lambda16Mid20ele(11:end,1),'k')
plot(L76x51x5Lambda20Mid20ele(11:end,5),L76x51x5Lambda20Mid20ele(11:end,1),'k')
% legend('Lambda0.4-DB20','Lambda0.8-DB20','Lambda0.9-DB20','Lambda1.0-DB20','Lambda1.2-DB20',...
%     'Lambda1.6-DB20','Lambda2.0-DB20')
% xlabel('rad') 
% ylabel('Pc/PY')
% xlim([-0.2 0.2])
% ylim([0 1.6])
% set(gca,'YTick',(0:0.05:1.6))
% grid on
% %% plot Pc/PY vs twist--mixed element
% figure
plot(mixedL76x51x5Lambda04Mid20ele(11:end,5),mixedL76x51x5Lambda04Mid20ele(11:end,1),'r--')
hold on
plot(mixedL76x51x5Lambda08Mid20ele(11:end,5),mixedL76x51x5Lambda08Mid20ele(11:end,1),'r--')
plot(mixedL76x51x5Lambda09Mid20ele(11:end,5),mixedL76x51x5Lambda09Mid20ele(11:end,1),'r--')
plot(mixedL76x51x5Lambda10Mid20ele(11:end,5),mixedL76x51x5Lambda10Mid20ele(11:end,1),'r--')
plot(mixedL76x51x5Lambda12Mid20ele(11:end,5),mixedL76x51x5Lambda12Mid20ele(11:end,1),'r--')
plot(mixedL76x51x5Lambda16Mid20ele(11:end,5),mixedL76x51x5Lambda16Mid20ele(11:end,1),'r--')
plot(mixedL76x51x5Lambda20Mid20ele(11:end,5),mixedL76x51x5Lambda20Mid20ele(11:end,1),'r--')
legend('Lambda0.4-DB20','Lambda0.8-DB20','Lambda0.9-DB20','Lambda1.0-DB20','Lambda1.2-DB20',...
     'Lambda1.6-DB20','Lambda2.0-DB20','mixedLambda0.4-DB20','mixedLambda0.8-DB20','mixedLambda0.9-DB20',...
    'mixedLambda1.0-DB20','mixedLambda1.2-DB20','mixedLambda1.6-DB20','mixedLambda2.0-DB20')
xlabel('rad') 
ylabel('Pc/PY')
xlim([-0.2 0.2])
ylim([0 1.6])
set(gca,'YTick',(0:0.05:1.6))
grid on
%% plot Pc/PY vs Lambda
figure
SLChan = csvread('SLChan.csv');
Kitipornchai = csvread('KitipornchaiElas.csv');
x=[0.4  0.8  0.9  1.0  1.2  1.6  2.0];
y=[1.35 1.00 0.89 0.77 0.58 0.35 0.23];
plot(x,y,'o')
hold on
plot(SLChan(:,1),SLChan(:,2))
plot(Kitipornchai(:,1),Kitipornchai(:,2))
xlim([0 2.0])
set(gca,'YTick',(0:0.2:2.0))
xlabel('Modified Slenderness') 
ylabel('Pc/PY')
legend('DB20','SLChan','Kitipornchai')