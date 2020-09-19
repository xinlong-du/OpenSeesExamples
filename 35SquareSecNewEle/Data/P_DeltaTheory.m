clear;clc;
DispEndFy=load('DispEndFy.out');
DispEndFz=load('DispEndFz.out');
DispEndMx=load('DispEndMx.out');
OriOPSDispEndFy=load('OriOPSDispEndFy.out');
OriOPSDispEndFz=load('OriOPSDispEndFz.out');
OriOPSDispEndMx=load('OriOPSDispEndMx.out');
%% plot u and v vs. lateral force
figure
plot(DispEndFy(1:3000,3),1000*DispEndFy(1:3000,1))
hold on
plot(DispEndFz(1:2000,4),1000*DispEndFz(1:2000,1))
plot(OriOPSDispEndFy(1:3000,3),1000*OriOPSDispEndFy(1:3000,1))
plot(OriOPSDispEndFz(1:2000,4),1000*OriOPSDispEndFz(1:2000,1))
legend('DB5-y','DB5-z','OriOPSDB5-y','OriOPSDB5-z')
xlabel('mm') 
ylabel('N')

%% plot phi vs torque
figure
plot(DispEndMx(:,5),100000*DispEndMx(:,1))
hold on
plot(OriOPSDispEndMx(:,5),100000*OriOPSDispEndMx(:,1))
legend('DB5-phi','OriOPSDB5-phi')
xlabel('rad') 
ylabel('N-mm')

%% plot shorten vs. torque
figure
plot(DispEndMx(:,2),100000*DispEndMx(:,1))
hold on
plot(OriOPSDispEndMx(:,2),100000*OriOPSDispEndMx(:,1))
legend('DB5-phi','OriOPSDB5-phi')
xlabel('shorten (mm)') 
ylabel('torque (N-mm)')