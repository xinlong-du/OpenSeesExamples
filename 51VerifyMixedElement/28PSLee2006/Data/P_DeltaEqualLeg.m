clear;clc;
DB20DispL4=load('zDB20LsectionEqualLegL4.out');
DB20DispL4BC=load('zDB20LsectionEqualLegL4ChangeBC.out');
DB20DispL4ContentPerturb=load('zDB20LsectionEqualLegL4ConcentPerturb.out');
%% plot u-force for L=4.0 m
figure
plot(-DB20DispL4(:,2),DB20DispL4(:,1),'k-')
hold on
plot(-2*DB20DispL4BC(:,2),DB20DispL4BC(:,1),'r-')
plot(-DB20DispL4ContentPerturb(:,2),DB20DispL4ContentPerturb(:,1),'b')
legend('DB20','DB20BC','DB20ContentPerturb')
xlim([0 0.06])
ylim([0 5000])
xlabel('m') 
ylabel('N')
%% %% plot u-force for L=1.0 m
DB20DispL1=load('zDB20LsectionEqualLegL1.out');
figure
plot(-DB20DispL1(:,2),DB20DispL1(:,1),'k-')