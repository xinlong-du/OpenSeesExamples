clear;clc;
DispEnd4LayerFy=load('YDispEnd4LayerFy.out');
DispEnd4LayerFyOO=load('YDispEnd4LayerFyOriginOpenSees.out');
DispEnd4LayerFz=load('YDispEnd4LayerFz.out');
DispEnd4LayerFzOO=load('YDispEnd4LayerFzOriginOpenSees.out');
%% plot Fy vs disp. y
figure
plot(DispEnd4LayerFy(:,3),DispEnd4LayerFy(:,1))
hold on
plot(DispEnd4LayerFyOO(:,3),DispEnd4LayerFyOO(:,1))
legend('DB104LayerFy','DB104LayerFyOO')
xlabel('mm') 
ylabel('N')

%% plot Fz vs disp. z
figure
plot(DispEnd4LayerFz(:,4),DispEnd4LayerFz(:,1))
hold on
plot(DispEnd4LayerFzOO(:,4),DispEnd4LayerFzOO(:,1))
legend('DB104LayerFz','DB104LayerFzOO')
xlabel('mm') 
ylabel('N')