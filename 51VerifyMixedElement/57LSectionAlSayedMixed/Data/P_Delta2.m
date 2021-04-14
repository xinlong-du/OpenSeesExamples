clear;clc;
DB20BC=load('L5x3InElasDB20BCMid.out');
DB20BCIniStre=load('L5x3InElasDB20BCIniStreMid.out');
DB20IniStreReal4=load('L5x3InElasDB20IniStreMidReal4.out');
%DB20IniStreReal5=load('L5x3InElasDB20IniStreMidReal5.out');
DB20IniStreReal5=load('L5x3LonDB20IniStreMidReal5.out');
AlSayed=csvread('AlSayed.csv');
%% plot
hfig=figure;
plot(-DB20BC(11:end,5),DB20BC(11:end,1),'k-','LineWidth',1.0)
hold on
plot(DB20BCIniStre(11:end,5),DB20BCIniStre(11:end,1),'k--','LineWidth',1.0)
%plot(DB20IniStreReal4(11:end,5),DB20IniStreReal4(11:end,1),'k-.','LineWidth',1.0)
plot(DB20IniStreReal5(11:end,5),DB20IniStreReal5(11:end,1)/128.99,'k-.','LineWidth',1.0)
plot(AlSayed(:,1),AlSayed(:,2),'ko','LineWidth',1.0)
legend('MB20 no resisual stress','MB20 standard residual stress','MB20 balanced residual stress','Al-Sayed and Bjorhovde')
legend('Location','southeast')
xlim([0 0.04])
ylim([0 0.4])
xlabel('Twist (rad)') 
ylabel('Axial Load Ratio, P/Py')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%%
max(DB20BCIniStre(11:end,1))*128.99
max(DB20IniStreReal5(11:end,1))