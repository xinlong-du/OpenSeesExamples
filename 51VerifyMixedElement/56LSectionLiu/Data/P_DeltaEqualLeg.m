clear;clc;
E900E10=load('E900E10Sta.out');
E900E9=load('E900E9Sta.out');
E900E8=load('E900E8Sta.out');
E900E7=load('E900E7StaIniStre.out');
E900E1=load('E900E1StaIniStre.out');
%% plot
figure
plot(2*E900E10(:,2),E900E10(:,1),'k-.','LineWidth',1.0)
hold on
plot(2*E900E9(:,2),E900E9(:,1),'k--','LineWidth',1.5)
plot(2*E900E8(:,2),E900E8(:,1),'k--','LineWidth',1.0)
plot(2*E900E7(:,2),E900E7(:,1),'k:','LineWidth',1.0)
plot(2*E900E1(:,2),E900E1(:,1),'k-','LineWidth',1.0)
legend('ey=50.4','ey=29.4','ey=16.8','ey=8.4','ey=0.0')
xlim([0 8])
ylim([0 120])
xlabel('mm') 
ylabel('kN')