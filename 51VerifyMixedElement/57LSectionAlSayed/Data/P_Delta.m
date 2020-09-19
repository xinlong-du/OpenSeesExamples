clear;clc;
DB20BC=load('L5x3InElasDB20BCMid.out');
DB20BCNoImp=load('L5x3InElasDB20BCNoImpMid.out');
DB20BCIniStre=load('L5x3InElasDB20BCIniStreMid.out');
DB20BCIniStreReal=load('L5x3InElasDB20BCIniStreMidReal.out');
DB20BCIniStreReal2=load('L5x3InElasDB20BCIniStreMidReal2.out');
DB20BCIniStreReal3=load('L5x3InElasDB20BCIniStreMidReal3.out');
DB20BCIniStreReal4=load('L5x3InElasDB20BCIniStreMidReal4.out');
DB20IniStreReal4=load('L5x3InElasDB20IniStreMidReal4.out');

AlSayed=csvread('AlSayed.csv');
%% plot
figure
plot(-DB20BC(11:end,5),DB20BC(11:end,1),'k-','LineWidth',1.0)
hold on
plot(-DB20BCNoImp(11:end,5),DB20BCNoImp(11:end,1),'r-','LineWidth',1.0)
plot(DB20BCIniStre(11:end,5),DB20BCIniStre(11:end,1),'k--','LineWidth',1.0)
plot(DB20BCIniStreReal(11:end,5),DB20BCIniStreReal(11:end,1),'b-','LineWidth',1.0)
plot(DB20BCIniStreReal2(11:end,5),DB20BCIniStreReal2(11:end,1),'c-','LineWidth',1.0)
plot(DB20BCIniStreReal3(11:end,5),DB20BCIniStreReal3(11:end,1),'r--','LineWidth',1.0)
plot(DB20BCIniStreReal4(11:end,5),DB20BCIniStreReal4(11:end,1),'g-','LineWidth',1.0)
plot(DB20IniStreReal4(1:end,5),DB20IniStreReal4(1:end,1),'r-.','LineWidth',1.0)
plot(AlSayed(:,1),AlSayed(:,2),'ko','LineWidth',1.0)
legend('DB20BC','DB20BCNoImp','DB20BCIniStre','DB20BCIniStreReal','DB20BCIniStreReal2',...
    'DB20BCIniStreReal3Biso=0.1','DB20BCIniStreReal4','DB20IniStreReal4','AlSayed')
%xlim([0 0.04])
ylim([0 0.4])
% xlabel('mm') 
% ylabel('kN')
max(DB20BCIniStreReal(11:end,1))*128.99
max(DB20BCIniStreReal4(11:end,1))*128.99