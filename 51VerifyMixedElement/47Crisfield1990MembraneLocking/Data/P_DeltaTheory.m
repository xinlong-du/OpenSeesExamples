clear;clc;
DispEnd=load('DispEnd.out');
DispEnd4Layer=load('DispEnd4Layer.out');
DispEnd8Layer10ele=load('DispEnd8Layer10ele.out');
DispEnd4Layer20ele=load('DispEnd4Layer20ele.out');
DispEnd8Layer20ele=load('DispEnd8Layer20ele.out');
DispEnd4Layer40ele=load('DispEnd4Layer40ele.out');
DispEnd8Layer40ele=load('DispEnd8Layer40ele.out');
DispEndOO=load('DispEndOriginOpenSees.out');
DispEnd4LayerOO=load('DispEnd4LayerOriginOpenSees.out');
DispEnd8Layer10eleOO=load('DispEnd8Layer10eleOriginOpenSees.out');
AlemDisp = csvread('Alemdar Disp.csv');
Crisfield = csvread('Crisfield.csv');
Simo = csvread('Simo.csv');
%% 4 layers examples and 8 layer examples
figure
% plot(DispEnd(11:end,4),DispEnd(11:end,1))
% hold on
plot(DispEnd4Layer(11:end,4),DispEnd4Layer(11:end,1))
hold on
plot(DispEnd8Layer10ele(11:end,4),DispEnd8Layer10ele(11:end,1),'--')
plot(DispEnd4Layer20ele(11:end,4),DispEnd4Layer20ele(11:end,1))
plot(DispEnd8Layer20ele(11:end,4),DispEnd8Layer20ele(11:end,1),'--')
plot(DispEnd4Layer40ele(11:end,4),DispEnd4Layer40ele(11:end,1))
plot(DispEnd8Layer40ele(11:end,4),DispEnd8Layer40ele(11:end,1),'--')
% plot(DispEndOO(11:end,4),DispEndOO(11:end,1))
% hold on
plot(DispEnd4LayerOO(11:end,4),DispEnd4LayerOO(11:end,1),':')
plot(AlemDisp(:,1),AlemDisp(:,2),'d')
plot(Crisfield(:,1),Crisfield(:,2),'s')
plot(Simo(:,1),Simo(:,2),'o')
% legend('DB10','DB104Layer','DB10OO','DB104LayerOO')
legend('DB10-4Layer','DB10-8Layer','DB20-4Layer','DB20-8Layer','DB40-4Layer','DB40-8Layer',...
    'DB10-4LayerOO','Alemdar Disp4','Crisfield10','Simo')
xlabel('mm') 
ylabel('N')
%% only 8 layer examples
figure
plot(DispEnd8Layer10ele(11:end,4),DispEnd8Layer10ele(11:end,1))
hold on
plot(DispEnd8Layer20ele(11:end,4),DispEnd8Layer20ele(11:end,1))
plot(DispEnd8Layer40ele(11:end,4),DispEnd8Layer40ele(11:end,1))
plot(DispEnd8Layer10eleOO(11:end,4),DispEnd8Layer10eleOO(11:end,1),'--')
plot(AlemDisp(:,1),AlemDisp(:,2),'d')
plot(Crisfield(:,1),Crisfield(:,2),'s')
plot(Simo(:,1),Simo(:,2),'o')
% legend('DB10','DB104Layer','DB10OO','DB104LayerOO')
legend('DB10-8Layer','DB20-8Layer','DB40-8Layer','DB10-8LayerOO',...
    'Alemdar Disp4','Crisfield10','Simo')
xlabel('mm') 
ylabel('N')