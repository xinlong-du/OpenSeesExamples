clear;clc;
DispEndFz05dispCtrl=load('2DispEndFz0.5dispCtrl.out');
DispEndFz1dispCtrl=load('2DispEndFz1.0dispCtrl.out');
DispEndFz1dispCtrlDB40=load('2DispEndFz1.0dispCtrlDB40.out');
DispEndFz1dispCtrlDB40Layer8=load('2DispEndFz1.0dispCtrlDB40Layer8.out');
DispEndFz1dispCtrlDB80Layer8=load('2DispEndFz1.0dispCtrlDB80Layer8.out');
DispEndFz1dispCtrlDB80Layer16=load('2DispEndFz1.0dispCtrlDB80Layer16.out');
Battini2 = csvread('Battini2.csv');
%%
figure
plot(DispEndFz05dispCtrl(11:end,4)/240,DispEndFz05dispCtrl(11:end,1))
hold on
plot(DispEndFz1dispCtrl(11:end,4)/240,DispEndFz1dispCtrl(11:end,1))
plot(DispEndFz1dispCtrlDB40(11:end,4)/240,DispEndFz1dispCtrlDB40(11:end,1))
plot(DispEndFz1dispCtrlDB40Layer8(11:end,4)/240,DispEndFz1dispCtrlDB40Layer8(11:end,1))
plot(DispEndFz1dispCtrlDB80Layer8(11:end,4)/240,DispEndFz1dispCtrlDB80Layer8(11:end,1))
plot(DispEndFz1dispCtrlDB80Layer16(11:end,4)/240,DispEndFz1dispCtrlDB80Layer16(11:end,1))
plot(Battini2(:,1),Battini2(:,2),'o')
legend('Fz=0.5','Fz=1.0','Fz=1.0DB40','Fz=1.0DB40Layer8','Fz=1.0DB80Layer8','Fz=1.0DB80Layer16','Battini-b3d')
xlabel('z-disp/L') 
ylabel('P/P0')
xlim([-0.1 0.6])
ylim([3 10])
set(gca,'XTick',(-0.1:0.1:0.6))
set(gca,'YTick',(3:1:10))
grid on