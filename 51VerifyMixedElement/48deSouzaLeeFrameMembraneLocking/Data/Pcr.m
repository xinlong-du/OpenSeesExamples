clear;clc;
%% Elastic
ElasDB10=load('LeeFrameElasDB10.out');
ElasDB20=load('LeeFrameElasDB20.out');
ElasDB40=load('LeeFrameElasDB40.out');
deSouzaElas = csvread('deSouzaElas.csv');
figure
plot(-ElasDB10(:,3)/10,ElasDB10(:,1))
hold on
plot(deSouzaElas(:,1),deSouzaElas(:,2),'o')
legend('ElasDB10','de Souza2000')
xlabel('v (cm)') 
ylabel('P (kN)')
grid on
figure
plot(-ElasDB20(:,3)/10,ElasDB20(:,1))
hold on
plot(-ElasDB40(:,3)/10,ElasDB40(:,1))
plot(deSouzaElas(:,1),deSouzaElas(:,2),'o')
legend('ElasDB20','ElasDB40','de Souza2000')
xlabel('v (cm)') 
ylabel('P (kN)')
xlim([0 100])
% set(gca,'YTick',(10:1:30))
grid on
%% Inelastic
InElasDB10=load('LeeFrameInElasDB10.out');
deSouzaInElas = csvread('deSouzaInElas.csv');
figure
plot(-InElasDB10(1:400,3)/10,InElasDB10(1:400,1))
hold on
plot(deSouzaInElas(:,1),deSouzaInElas(:,2),'o')
legend('InElasDB10','de Souza2000')
xlabel('v (cm)') 
ylabel('P (kN)')
xlim([0 100])
% set(gca,'YTick',(10:1:30))
grid on