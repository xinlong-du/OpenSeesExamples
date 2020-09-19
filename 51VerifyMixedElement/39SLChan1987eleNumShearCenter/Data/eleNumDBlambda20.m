clear;clc;
L76x51x5InElasLambda06MidDB20=load('L76x51x5InElasLambda20Mid20eleBC.out');
L76x51x5InElasLambda06MidDB2=load('L76x51x5InElasLambda20MidDB2.out');

L76x51x5InElasLambda06MidMB20=load('mixedL76x51x5InElasLambda20Mid20eleBC.out');
L76x51x5InElasLambda06MidMB2=load('mixedL76x51x5InElasLambda20MidMB2.out');
figure
plot(L76x51x5InElasLambda06MidDB20(11:end,5),L76x51x5InElasLambda06MidDB20(11:end,1))
hold on
plot(L76x51x5InElasLambda06MidDB2(11:end,5),L76x51x5InElasLambda06MidDB2(11:end,1))
plot(L76x51x5InElasLambda06MidMB20(11:end,5),L76x51x5InElasLambda06MidMB20(11:end,1))
plot(L76x51x5InElasLambda06MidMB2(11:end,5),L76x51x5InElasLambda06MidMB2(11:end,1))
legend('DB20','DB2','MB20','MB2')

%% axial disp. of start node
L76x51x5InElasLambda06StaDB20=load('L76x51x5InElasLambda20Sat20eleBC.out');
L76x51x5InElasLambda06StaDB2=load('L76x51x5InElasLambda20SatDB2.out');
L76x51x5InElasLambda06StaDB3=load('L76x51x5InElasLambda20SatDB3.out');

L76x51x5InElasLambda06StaMB20=load('mixedL76x51x5InElasLambda20Sat20eleBC.out');
L76x51x5InElasLambda06StaMB2=load('mixedL76x51x5InElasLambda20SatMB2.out');
L76x51x5InElasLambda06StaMB3=load('mixedL76x51x5InElasLambda20SatMB3.out');
L76x51x5InElasLambda06StaMB20IntPt2=load('mixedL76x51x5InElasLambda20Sat20eleBCIntPt2.out');
L76x51x5InElasLambda06StaMB2IntPt2=load('mixedL76x51x5InElasLambda20SatMB2IntPt2.out');
L76x51x5InElasLambda06StaMB3IntPt2=load('mixedL76x51x5InElasLambda20SatMB3IntPt2.out');
L76x51x5InElasLambda06StaMB4IntPt2=load('mixedL76x51x5InElasLambda20SatMB4IntPt2.out');
L76x51x5InElasLambda06StaMB5IntPt2=load('mixedL76x51x5InElasLambda20SatMB5IntPt2.out');
figure
plot(L76x51x5InElasLambda06StaDB20(1:end,2),L76x51x5InElasLambda06StaDB20(1:end,1),'k-','LineWidth',1.0)
hold on
plot(L76x51x5InElasLambda06StaDB3(1:end,2),L76x51x5InElasLambda06StaDB3(1:end,1),'k--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaDB2(1:end,2),L76x51x5InElasLambda06StaDB2(1:end,1),'k-.','LineWidth',1.0)

plot(L76x51x5InElasLambda06StaMB20(1:end,2),L76x51x5InElasLambda06StaMB20(1:end,1),'r-','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB3(1:end,2),L76x51x5InElasLambda06StaMB3(1:end,1),'r--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB2(1:end,2),L76x51x5InElasLambda06StaMB2(1:end,1),'r-.','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB20IntPt2(1:end,2),L76x51x5InElasLambda06StaMB20IntPt2(1:end,1),'b-','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB3IntPt2(1:end,2),L76x51x5InElasLambda06StaMB3IntPt2(1:end,1),'b--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB2IntPt2(1:end,2),L76x51x5InElasLambda06StaMB2IntPt2(1:end,1),'b-.','LineWidth',1.0)
legend('DB20','DB3','DB2','MB20','MB3','MB2','MB20IntPt2','MB3IntPt2','MB2IntPt2')
%%
figure
plot(L76x51x5InElasLambda06StaDB20(11:end,2),L76x51x5InElasLambda06StaDB20(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L76x51x5InElasLambda06StaDB3(11:end,2),L76x51x5InElasLambda06StaDB3(11:end,1),'k--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaDB2(11:end,2),L76x51x5InElasLambda06StaDB2(11:end,1),'k-.','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB20IntPt2(1:end,2),L76x51x5InElasLambda06StaMB20IntPt2(1:end,1),'r-','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB5IntPt2(1:end,2),L76x51x5InElasLambda06StaMB5IntPt2(1:end,1),'m-','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB4IntPt2(1:end,2),L76x51x5InElasLambda06StaMB4IntPt2(1:end,1),'r:','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB3IntPt2(1:end,2),L76x51x5InElasLambda06StaMB3IntPt2(1:end,1),'r--','LineWidth',1.0)
plot(L76x51x5InElasLambda06StaMB2IntPt2(1:end,2),L76x51x5InElasLambda06StaMB2IntPt2(1:end,1),'r-.','LineWidth',1.0)
legend('DB20','DB3','DB2','MB20','MB5','MB4','MB3','MB2')