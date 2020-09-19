clear;clc;
DispM0DB20layer2t0794=load('CantileverDispM0DB20layer2t0794.out');
DispM0DB20layer2t0794M=load('CantileverDispM0DB20layer2t0794-.out');

DispM2440DB20layer2t0794=load('CantileverDispM2440DB20layer2t0794.out');
DispM2440DB20layer2t0794M=load('CantileverDispM2440DB20layer2t0794-.out');

DispM4890DB20layer2t0794=load('CantileverDispM4890DB20layer2t0794.out');
DispM4890DB20layer2t0794M=load('CantileverDispM4890DB20layer2t0794-.out');

DispM7340DB20layer2t0794=load('CantileverDispM7340DB20layer2t0794.out');
DispM7340DB20layer2t0794M=load('CantileverDispM7340DB20layer2t0794-.out');

DispM8560DB20layer2t0794=load('CantileverDispM8560DB20layer2t0794.out');
DispM8560DB20layer2t0794M=load('CantileverDispM8560DB20layer2t0794-.out');

DispM9780DB20layer2t0794=load('CantileverDispM9780DB20layer2t0794.out');
DispM9780DB20layer2t0794M=load('CantileverDispM9780DB20layer2t0794-.out');

DispM11000DB20layer2t0794=load('CantileverDispM11000DB20layer2t0794.out');
DispM11000DB20layer2t0794M=load('CantileverDispM11000DB20layer2t0794-.out');

Exp = csvread('Exp.csv');
%%
figure
plot(Exp(:,1),Exp(:,2),'o')
hold on
plot(DispM0DB20layer2t0794(:,5),400*DispM0DB20layer2t0794(:,1)+2000)
plot(DispM0DB20layer2t0794M(:,5),-400*DispM0DB20layer2t0794M(:,1)+2000)
plot(DispM2440DB20layer2t0794(101:end,5),400*DispM2440DB20layer2t0794(101:end,1)+1800)
plot(DispM2440DB20layer2t0794M(101:end,5),-400*DispM2440DB20layer2t0794M(101:end,1)+1800)
plot(DispM4890DB20layer2t0794(101:end,5),400*DispM4890DB20layer2t0794(101:end,1)+1600)
plot(DispM4890DB20layer2t0794M(101:end,5),-400*DispM4890DB20layer2t0794M(101:end,1)+1600)
plot(DispM7340DB20layer2t0794(101:end,5),400*DispM7340DB20layer2t0794(101:end,1)+1400)
plot(DispM7340DB20layer2t0794M(101:end,5),-400*DispM7340DB20layer2t0794M(101:end,1)+1400)
plot(DispM8560DB20layer2t0794(101:end,5),400*DispM8560DB20layer2t0794(101:end,1)+1200)
plot(DispM8560DB20layer2t0794M(101:end,5),-400*DispM8560DB20layer2t0794M(101:end,1)+1200)
plot(DispM9780DB20layer2t0794(101:end,5),400*DispM9780DB20layer2t0794(101:end,1)+1000)
plot(DispM9780DB20layer2t0794M(101:end,5),-400*DispM9780DB20layer2t0794M(101:end,1)+1000)
plot(DispM11000DB20layer2t0794(101:end,5),400*DispM11000DB20layer2t0794(101:end,1)+800)
plot(DispM11000DB20layer2t0794M(101:end,5),-400*DispM11000DB20layer2t0794M(101:end,1)+800)
legend('Experiment')
xlabel('rad') 
ylabel('N-mm')
xlim([-0.4 0.4])
ylim([0 3000])
set(gca,'YTick',(0:200:3000))
set(gca,'XTick',(-0.4:0.1:0.4))
grid on