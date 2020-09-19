clear;clc;
DispEnd4LayerFy=load('DispEnd4LayerFy.out');
DispEnd4LayerFyOO=load('DispEnd4LayerFyOriginOpenSees.out');
DispEnd4LayerFz=load('DispEnd4LayerFz.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd4LayerFzOO10ele=load('DispEnd4LayerFzOriginOpenSees10ele.out');
%M9039 = csvread('M9039.csv');
%% plot Fy vs disp. y
figure
plot(DispEnd4LayerFy(:,3),DispEnd4LayerFy(:,1))
hold on
plot(DispEnd4LayerFyOO(:,3),DispEnd4LayerFyOO(:,1))
legend('DB5-4LayerFy','DB5-4LayerFyOO')
xlabel('mm') 
ylabel('N')

%% plot Fz vs disp. z
figure
plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1))
hold on
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1))
hold on
plot(DispEnd4LayerFzOO10ele(1:15000,4),DispEnd4LayerFzOO10ele(1:15000,1))
legend('DB5-4LayerFz','DB5-4LayerFzOO','DB10-4LayerFzOO')
xlabel('mm') 
ylabel('N')

%% compare Fz-z with swapped Fy-y
YDispEnd4LayerFy=load('YDispEnd4LayerFy.out');
YDispEnd4LayerFyOO=load('YDispEnd4LayerFyOriginOpenSees.out');
figure
plot(DispEnd4LayerFz(1:2000,4),DispEnd4LayerFz(1:2000,1))
hold on
plot(DispEnd4LayerFzOO(1:2000,4),DispEnd4LayerFzOO(1:2000,1))
hold on
plot(YDispEnd4LayerFy(1:1200,3),YDispEnd4LayerFy(1:1200,1))
hold on
plot(YDispEnd4LayerFyOO(1:1200,3),YDispEnd4LayerFyOO(1:1200,1))
legend('DB5-4LayerFz','DB5-4LayerFzOO','YDB5-4LayerFy','YDB5-4LayerFyOO')
xlabel('mm') 
ylabel('N')

%% compare Fy-y with swapped Fz-z
YDispEnd4LayerFz=load('YDispEnd4LayerFz.out');
YDispEnd4LayerFzOO=load('YDispEnd4LayerFzOriginOpenSees.out');
figure
plot(DispEnd4LayerFy(:,3),DispEnd4LayerFy(:,1))
hold on
plot(DispEnd4LayerFyOO(:,3),DispEnd4LayerFyOO(:,1))
hold on
plot(YDispEnd4LayerFz(:,4),YDispEnd4LayerFz(:,1))
hold on
plot(YDispEnd4LayerFzOO(:,4),YDispEnd4LayerFzOO(:,1))
legend('DB5-4LayerFz','DB5-4LayerFzOO','YDB5-4LayerFy','YDB5-4LayerFyOO')
xlabel('mm') 
ylabel('N')