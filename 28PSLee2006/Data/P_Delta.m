clear;clc;
DispL0=load('LsectionSimpDispL0.out');
DispL1=load('LsectionSimpDispL1.out');
DispL4=load('LsectionSimpDispL4.out');
LeeL0 = csvread('L0.csv');
LeeL1 = csvread('L1.csv');
LeeL4 = csvread('L4.csv');
%% plot u-force for L=0.25 m
figure
plot(LeeL0(:,1),LeeL0(:,2));
hold on
plot(-DispL0(:,2),40000*DispL0(:,1))
legend('Lee','DB10')
xlim([0 0.0012])
ylim([0 48000])
xlabel('m') 
ylabel('N')
%% plot u-force for L=1.0 m
figure
plot(LeeL1(:,1),LeeL1(:,2));
hold on
plot(-DispL1(:,2),25000*DispL1(:,1))
legend('Lee','DB10')
xlim([0 0.016])
ylim([0 30000])
xlabel('m') 
ylabel('N')
%% plot u-force for L=4.0 m
figure
plot(LeeL4(:,1),LeeL4(:,2));
hold on
plot(-DispL4(:,2),6000*DispL4(:,1))
legend('Lee','DB10')
xlim([0 0.08])
ylim([0 7500])
xlabel('m') 
ylabel('N')