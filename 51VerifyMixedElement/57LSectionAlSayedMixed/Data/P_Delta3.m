clear;clc;
ShoDB20IniStre=load('shoL5x3DB20IniStreMid.out');
MidDB20IniStre=load('MidL5x3DB20IniStreMid.out');
LonDB20IniStre=load('L5x3InElasDB20BCIniStreMid.out');

ShoDB20IniStreReal=load('L5x3ShoDB20IniStreMidReal.out');
MidDB20IniStreReal=load('L5x3MidDB20IniStreMidReal.out');
LonDB20IniStreReal=load('L5x3LonDB20IniStreMidReal.out');

ShoDB20IniStreMeasure=load('L5x3ShoDB20IniStreMidMeasure.out');
MidDB20IniStreMeasure=load('L5x3MidDB20IniStreMidMeasure.out');
LonDB20IniStreMeasure=load('L5x3LonDB20IniStreMidMeasure.out');

ShoDB20IniStreReal5=load('L5x3ShoDB20IniStreMidReal5.out');
MidDB20IniStreReal5=load('L5x3MidDB20IniStreMidReal5.out');
LonDB20IniStreReal5=load('L5x3LonDB20IniStreMidReal5.out');
%% plot
figure
plot(ShoDB20IniStre(11:end,5),ShoDB20IniStre(11:end,1),'k-','LineWidth',1.0)
hold on
plot(MidDB20IniStre(11:end,5),MidDB20IniStre(11:end,1),'k--','LineWidth',1.0)
plot(LonDB20IniStre(11:end,5),128.99*LonDB20IniStre(11:end,1),'k-.','LineWidth',1.0)

plot(ShoDB20IniStreReal(11:end,5),ShoDB20IniStreReal(11:end,1),'r-','LineWidth',1.0)
plot(MidDB20IniStreReal(11:end,5),MidDB20IniStreReal(11:end,1),'r--','LineWidth',1.0)
plot(LonDB20IniStreReal(11:end,5),LonDB20IniStreReal(11:end,1),'r-.','LineWidth',1.0)

plot(ShoDB20IniStreMeasure(11:end,5),ShoDB20IniStreMeasure(11:end,1),'b-','LineWidth',1.0)
plot(MidDB20IniStreMeasure(11:end,5),MidDB20IniStreMeasure(11:end,1),'b--','LineWidth',1.0)
plot(LonDB20IniStreMeasure(11:end,5),LonDB20IniStreMeasure(11:end,1),'b-.','LineWidth',1.0)

plot(ShoDB20IniStreReal5(11:end,5),ShoDB20IniStreReal5(11:end,1),'g-','LineWidth',1.0)
plot(MidDB20IniStreReal5(11:end,5),MidDB20IniStreReal5(11:end,1),'g--','LineWidth',1.0)
plot(LonDB20IniStreReal5(11:end,5),LonDB20IniStreReal5(11:end,1),'g-.','LineWidth',1.0)
% legend('DB20NoResiStress','DB20StandardResiStress','DB20MeasuredResiStress','AlSayed')
% xlim([0 0.04])
% ylim([0 0.4])
xlabel('rad') 
ylabel('P (kips)')
max(ShoDB20IniStre(:,1))
max(MidDB20IniStre(:,1))
max(LonDB20IniStre(11:end,1))*128.99

max(ShoDB20IniStreReal(11:end,1))
max(MidDB20IniStreReal(11:end,1))
max(LonDB20IniStreReal(11:end,1))

max(ShoDB20IniStreMeasure(11:end,1))
max(MidDB20IniStreMeasure(11:end,1))
max(LonDB20IniStreMeasure(11:end,1))

max(ShoDB20IniStreReal5(11:end,1))
max(MidDB20IniStreReal5(11:end,1))
max(LonDB20IniStreReal5(11:end,1))