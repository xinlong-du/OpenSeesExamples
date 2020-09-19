clear;clc;
DispEndFz00001=load('DispEndFz0.0001.out');
DispEndFz00001dispCtrl=load('DispEndFz0.0001dispCtrl.out');
DispEndFz0001=load('DispEndFz0.001.out');
DispEndFz0001dispCtrl=load('DispEndFz0.001dispCtrl.out');
DispEndFz0001dispCtrlDB40=load('DispEndFz0.001dispCtrlDB40.out');
DispEndFz0001dispCtrlDB80=load('DispEndFz0.001dispCtrlDB80.out');
DispEndFz0001dispCtrlDB100=load('DispEndFz0.001dispCtrlDB100.out');
DispEndFz0001dispCtrlDB100Int10=load('DispEndFz0.001dispCtrlDB100Int10.out');
DispEndFz0001dispCtrlDB80Layer8=load('DispEndFz0.001dispCtrlDB80Layer8.out');
Battini1 = csvread('Battini1.csv');
%% plot u and v vs. lateral force
figure
plot(DispEndFz00001(11:end,4)/100,DispEndFz00001(11:end,1))
hold on
plot(DispEndFz00001dispCtrl(11:end,4)/100,DispEndFz00001dispCtrl(11:end,1))
plot(DispEndFz0001(11:end,4)/100,DispEndFz0001(11:end,1))
plot(DispEndFz0001dispCtrl(11:4500,4)/100,DispEndFz0001dispCtrl(11:4500,1))
plot(DispEndFz0001dispCtrlDB40(11:end,4)/100,DispEndFz0001dispCtrlDB40(11:end,1))
plot(DispEndFz0001dispCtrlDB80(11:end,4)/100,DispEndFz0001dispCtrlDB80(11:end,1))
plot(DispEndFz0001dispCtrlDB100(11:end,4)/100,DispEndFz0001dispCtrlDB100(11:end,1))
plot(DispEndFz0001dispCtrlDB100Int10(11:end,4)/100,DispEndFz0001dispCtrlDB100Int10(11:end,1))
plot(DispEndFz0001dispCtrlDB80Layer8(11:end,4)/100,DispEndFz0001dispCtrlDB80Layer8(11:end,1))
plot(Battini1(:,1),Battini1(:,2),'o')
legend('Fz=0.0001','Fz=0.0001dispCtrl','Fz=0.001','Fz=0.001dispCtrl','Fz=0.001dispCtrlDB40','Fz=0.001dispCtrlDB80',...
    'Fz=0.001dispCtrlDB100','Fz=0.001dispCtrlDB100Int10','Fz=0.001dispCtrlDB80Layer8','Battini-b3d')
xlabel('z-disp/L') 
ylabel('P/P0')
xlim([-0.1 0.5])
ylim([3 12])
set(gca,'XTick',(-0.1:0.1:0.5))
set(gca,'YTick',(3:1:12))
grid on