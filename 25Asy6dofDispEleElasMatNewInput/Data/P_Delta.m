clear;clc;
Disp=load('CantileverDispModifyFiber2layer.out');
B_u = csvread('Battini_u.csv');
B_v = csvread('Battini_v.csv');
B_w = csvread('Battini_w.csv');
%% plot u and v vs. axial force
figure
plot(0.0393701*B_u(:,1),0.22*B_u(:,2))
hold on
plot(0.0393701*B_v(:,1),0.22*B_v(:,2))
plot(-Disp(1:13189,2),15*Disp(1:13189,1))
plot(-Disp(1:13189,3),15*Disp(1:13189,1))
hold off
legend('Battini-u','Battini-v','DB30-u','DB30-v')
xlabel('inches') 
ylabel('kips') 
%% plot w vs. axial force
figure
plot(0.0393701*B_w(:,1),0.22*B_w(:,2))
hold on
plot(Disp(1:13189,4),15*Disp(1:13189,1))
legend('Battini-w','DB30-w')
xlabel('inches') 
ylabel('kips')  