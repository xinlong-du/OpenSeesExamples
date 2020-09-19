clear;clc;
McrDispMid=load('McrDispMidDB80Layer8.out');
figure
plot(McrDispMid(:,4),McrDispMid(:,1))
xlabel('z-disp/L') 
ylabel('M/100')
xlim([0 30])
ylim([0 12])
set(gca,'XTick',(0:5:30))
set(gca,'YTick',(0:1:12))
grid on

%%
Mcr2DispMid=load('Mcr2DispMidDB30Layer16.out');
figure
plot(Mcr2DispMid(:,4),Mcr2DispMid(:,1))
xlabel('z-disp/L') 
ylabel('M/100000')
xlim([0 80])
ylim([0 15])
set(gca,'XTick',(0:10:80))
set(gca,'YTick',(0:1:15))
grid on
