clear;clc;
DispM0=load('CantileverDispM0.out');
DispM0DB20layer2t0794=load('CantileverDispM0DB20layer2t0794.out');
DispM0DB20layer2t0794M=load('CantileverDispM0DB20layer2t0794-.out');
DispM7340=load('CantileverDispM7340.out');
DispM7340DB20layer2t0794=load('CantileverDispM7340DB20layer2t0794.out');
DispM9780=load('CantileverDispM9780.out');
DispM9780DB20layer2t0794=load('CantileverDispM9780DB20layer2t0794.out');
DispM11000=load('CantileverDispM11000.out');
DispM11000DB20=load('CantileverDispM11000DB20.out');
DispM11000DB20Step1000=load('CantileverDispM11000DB20-1000steps.out');
DispM11000DB40=load('CantileverDispM11000DB40.out');
DispM11000DB20layer2=load('CantileverDispM11000DB20layer2.out');
DispM11000DB20layer2t0794=load('CantileverDispM11000DB20layer2t0794.out');
M0 = csvread('M0.csv');
M7340 = csvread('M7340.csv');
M9780 = csvread('M9780.csv');
M11000 = csvread('M11000.csv');
ExpM0 = csvread('ExpM0.csv');
ExpM7340 = csvread('ExpM7340.csv');
ExpM9780 = csvread('ExpM9780.csv');
ExpM11000 = csvread('ExpM11000.csv');
%% M=0
figure
plot(DispM0(:,5),400*DispM0(:,1))
hold on
plot(DispM0DB20layer2t0794(:,5),400*DispM0DB20layer2t0794(:,1))
plot(DispM0DB20layer2t0794M(:,5),-400*DispM0DB20layer2t0794M(:,1))
plot(M0(:,1),M0(:,2))
plot(ExpM0(:,1),ExpM0(:,2),'o')
legend('DB10','DB20layer2t0794','DB20layer2t0794M','Hsiao','Exp.')
xlabel('rad') 
ylabel('N-mm')
grid on
title('M=0')
%% M=7340
figure
plot(DispM7340(101:end,5),400*DispM7340(101:end,1))
hold on
plot(DispM7340DB20layer2t0794(101:end,5),400*DispM7340DB20layer2t0794(101:end,1))
plot(M7340(:,1),M7340(:,2))
plot(ExpM7340(:,1),ExpM7340(:,2),'o')
legend('DB10','DB20layer2t0794','Hsiao','Exp.')
xlabel('rad') 
ylabel('N-mm')
title('M=7340')
%% M=9780
figure
plot(DispM9780(101:end,5),400*DispM9780(101:end,1))
hold on
plot(DispM9780DB20layer2t0794(101:end,5),400*DispM9780DB20layer2t0794(101:end,1))
plot(M9780(:,1),M9780(:,2))
plot(ExpM9780(:,1),ExpM9780(:,2),'o')
legend('DB10','DB20layer2t0794','Hsiao','Exp.')
xlabel('rad') 
ylabel('N-mm')
title('M=9780')
%% M=11000
figure
plot(DispM11000(101:end,5),400*DispM11000(101:end,1))
hold on
plot(DispM11000DB20(101:end,5),400*DispM11000DB20(101:end,1))
%plot(DispM11000DB20Step1000(101:900,5),400*DispM11000DB20Step1000(101:900,1))
plot(DispM11000DB40(101:end,5),400*DispM11000DB40(101:end,1))
plot(DispM11000DB20layer2(101:end,5),400*DispM11000DB20layer2(101:end,1))
plot(DispM11000DB20layer2t0794(101:end,5),400*DispM11000DB20layer2t0794(101:end,1))
plot(M11000(:,1),M11000(:,2))
plot(ExpM11000(:,1),ExpM11000(:,2),'o')
%legend('DB10','DB20','DB20Step1000','DB40','DB20layer2','Hsiao','Exp.')
legend('DB10','DB20','DB40','DB20layer2','DB20layer2t0794','Hsiao','Exp.')
xlabel('rad') 
ylabel('N-mm')
title('M=11000')