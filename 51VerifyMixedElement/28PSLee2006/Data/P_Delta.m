clear;clc;
DB10DispL4=load('DB10LsectionSimpDispL4.out');
DB20DispL4=load('DB20LsectionSimpDispL4.out');

MB10DispL4=load('MB10LsectionSimpDispL4.out');
MB20DispL4=load('MB20LsectionSimpDispL4.out');

LeeL4 = csvread('L4.csv');
ABAL4 = xlsread('ABAL4.xlsx');
%% plot u-force for L=4.0 m
figure
plot(LeeL4(:,1),LeeL4(:,2));
hold on
plot(-DB10DispL4(:,2),6000*DB10DispL4(:,1),'k--')
plot(-DB20DispL4(:,2),6000*DB20DispL4(:,1),'k-')
plot(-MB10DispL4(:,2),6000*MB10DispL4(:,1),'r--')
plot(-MB20DispL4(:,2),6000*MB20DispL4(:,1),'r-')
plot(-ABAL4(:,1),-ABAL4(:,2),'b--')
legend('Lee','DB10','DB20','MB10','MB20','ABAQUS B33-10')
xlim([0 0.08])
ylim([0 7500])
xlabel('disp. in x direction (m)') 
ylabel('N')