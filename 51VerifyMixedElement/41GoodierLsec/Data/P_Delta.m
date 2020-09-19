clear;clc;
DispM73ele20=load('DispM-73ele20.out');
DispM0ele20=load('DispM0ele20.out');
DispM1028=load('DispM1028.out');
DispM2135=load('DispM2135.out');
DispM2135ele20=load('DispM2135ele20.out');
DispM2135ele20T=load('DispM2135ele20-T.out');
DispM3231ele20=load('DispM3231ele20.out');
DispM4338ele20=load('DispM4338ele20.out');
DispM5445ele20=load('DispM5445ele20.out');
%DispM5445Negele20=load('DispM-5445ele20.out');
Goodier = csvread('Goodier.csv');
%% plot u and v vs. axial force
%% M=0
figure
plot(903.88/2/112.98*DispM73ele20(11:end,1),DispM73ele20(11:end,5)/18.4)
hold on
plot(903.88/2/112.98*DispM0ele20(11:end,1),DispM0ele20(11:end,5)/18.4)
plot(903.88/2/112.98*DispM1028(11:end,1),DispM1028(11:end,5)/18.4)
plot(903.88/2/112.98*DispM2135(11:end,1),DispM2135(11:end,5)/18.4)
plot(903.88/2/112.98*DispM2135ele20(11:end,1),DispM2135ele20(11:end,5)/18.4)
plot(903.88/2/112.98*DispM2135ele20T(11:90,1),-DispM2135ele20T(11:90,5)/18.4)
plot(903.88/2/112.98*DispM3231ele20(11:end,1),DispM3231ele20(11:end,5)/18.4)
plot(903.88/2/112.98*DispM4338ele20(11:end,1),DispM4338ele20(11:end,5)/18.4)
plot(903.88/2/112.98*DispM5445ele20(11:end,1),DispM5445ele20(11:end,5)/18.4)
%plot(903.88/2/112.98*DispM5445Negele20(11:end,1),DispM5445Negele20(11:end,5)/18.4,'*')
plot(Goodier(:,1),Goodier(:,2),'o')
legend('M=-0.65ele20','M=0ele20','M=9.1','M=18.9','M=18.9ele20','M=18.9ele20-T','M=28.6ele20',...
    'M=38.4ele20','M=48.2ele20','Goodier1953')
xlabel('lb-in') 
ylabel('rad/in')
grid on