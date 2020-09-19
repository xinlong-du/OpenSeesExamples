clear;clc;
DispEnd4Layer=load('DispEnd4Layer.out');
DispEnd8Layer40ele=load('DispEnd8Layer40ele.out');
DispEnd4LayerOO=load('DispEnd4LayerOriginOpenSees.out');
%M9039 = csvread('M9039.csv');
%% plot twist vs. torque
figure
plot(DispEnd4Layer(:,5),DispEnd4Layer(:,1))
hold on
plot(DispEnd8Layer40ele(1:13000,5),DispEnd8Layer40ele(1:13000,1))
plot(DispEnd4LayerOO(:,5),DispEnd4LayerOO(:,1))
legend('DB5-4Layer','DB40-8Layer','DB5-4LayerOO')
xlabel('twist (rad)') 
ylabel('torque (N-mm)')

%% plot shorten vs. torque
figure
plot(DispEnd4Layer(:,2),DispEnd4Layer(:,1))
hold on
plot(DispEnd8Layer40ele(1:13000,2),DispEnd8Layer40ele(1:13000,1))
plot(DispEnd4LayerOO(:,2),DispEnd4LayerOO(:,1))
legend('DB5-4Layer','DB40-8Layer','DB5-4LayerOO')
xlabel('shorten (mm)') 
ylabel('torque (N-mm)')