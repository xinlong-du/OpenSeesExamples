clear;clc;
L76x51x5InElasLambda06MidDB20=load('L76x51x5InElasLambda06Mid20eleBC.out');
L76x51x5InElasLambda06MidDB2=load('L76x51x5InElasLambda06MidDB2.out');

L76x51x5InElasLambda06MidMB20=load('mixedL76x51x5InElasLambda06Mid20eleBC.out');
L76x51x5InElasLambda06MidMB2=load('mixedL76x51x5InElasLambda06MidMB2.out');
figure
plot(L76x51x5InElasLambda06MidDB20(11:end,5),L76x51x5InElasLambda06MidDB20(11:end,1))
hold on
plot(L76x51x5InElasLambda06MidDB2(11:end,5),L76x51x5InElasLambda06MidDB2(11:end,1))
plot(L76x51x5InElasLambda06MidMB20(11:end,5),L76x51x5InElasLambda06MidMB20(11:end,1))
plot(L76x51x5InElasLambda06MidMB2(11:end,5),L76x51x5InElasLambda06MidMB2(11:end,1))
legend('DB20','DB2','MB20','MB2')

%% axial disp. of start node
L76x51x5InElasLambda06StaDB20=load('L76x51x5InElasLambda06Sat20eleBC.out');
L76x51x5InElasLambda06StaDB2=load('L76x51x5InElasLambda06SatDB2.out');
L76x51x5InElasLambda06StaDB3=load('L76x51x5InElasLambda06SatDB3.out');

L76x51x5InElasLambda06StaMB20=load('mixedL76x51x5InElasLambda06Sat20eleBC.out');
L76x51x5InElasLambda06StaMB2=load('mixedL76x51x5InElasLambda06SatMB2.out');
figure
plot(L76x51x5InElasLambda06StaDB20(11:end,2),L76x51x5InElasLambda06StaDB20(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L76x51x5InElasLambda06StaDB3(11:end,2),L76x51x5InElasLambda06StaDB3(11:end,1),'k--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaDB2(11:end,2),L76x51x5InElasLambda06StaDB2(11:end,1),'k-.','LineWidth',1.0)

plot(L76x51x5InElasLambda06StaMB20(11:end,2),L76x51x5InElasLambda06StaMB20(11:end,1),'r-','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB2(11:end,2),L76x51x5InElasLambda06StaMB2(11:end,1),'r--','LineWidth',1.0)
legend('DB20','DB3','DB2','MB20','MB2')
