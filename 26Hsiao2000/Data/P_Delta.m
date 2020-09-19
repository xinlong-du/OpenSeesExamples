clear;clc;
Disp=load('CantileverDisp.out');
Disp2layer=load('CantileverDisp2layer.out');
Exp = csvread('twist.csv');
Num = csvread('twist2.csv');
%% plot u and v vs. axial force
figure
plot(Disp(1:13090,4),Disp(1:13090,3))
hold on
plot(Disp2layer(1:13090,4),Disp2layer(1:13090,3))
hold on
plot(Exp(:,1),Exp(:,2),'o')
hold on
plot(Num(:,1),Num(:,2))
legend('DB20','DB20-2layer','Exp','Num')
xlabel('mm') 
ylabel('mm') 
set(gca,'YDir','reverse')
axis equal