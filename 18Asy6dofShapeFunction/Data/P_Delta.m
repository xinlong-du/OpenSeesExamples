clear;clc;
Disp=load('CantileverDispLoadStep2.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
figure
plot(0.0393701*B_u(:,1),0.22*B_u(:,2))
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2))
plot(-Disp(:,2),15*Disp(:,1))
plot(-Disp(:,3),15*Disp(:,1))
hold off
legend('Battini-u','Battini-v','MyAns-u','MyAns-v')
xlabel('inches') 
ylabel('kips') 
%% plot w vs. axial force
figure
plot(0.0393701*B_w(:,1),0.22*B_w(:,2))
hold on
plot(Disp(:,4),15*Disp(:,1))
legend('Battini-w','MyAns-w')
xlabel('inches') 
ylabel('kips') 
%% plot u, v amd w vs. axial force
figure
plot(0.0393701*B_u(1:6,1),0.22*B_u(1:6,2))
hold on
plot(0.0393701*B_v(1:7,1),0.22*B_v(1:7,2))
plot(0.0393701*B_w(:,1),0.22*B_w(:,2))
legend('Battini-u','Battini-v','Battini-w')
xlabel('inches') 
ylabel('kips') 
