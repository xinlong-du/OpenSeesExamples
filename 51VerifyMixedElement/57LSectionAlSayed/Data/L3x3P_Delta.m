clear;clc;
ShoDB20IniStre=load('L3x3ShoDB20IniStreMid.out');
MidDB20IniStre=load('L3x3MidDB20IniStreMid.out');
LonDB20IniStre=load('L3x3LonDB20IniStreMid.out');

ShoDB20IniStreReal=load('L3x3ShoDB20IniStreMidReal.out');
MidDB20IniStreReal=load('L3x3MidDB20IniStreMidReal.out');
LonDB20IniStreReal=load('L3x3LonDB20IniStreMidReal.out');
%% plot
figure
plot(ShoDB20IniStre(11:end,3),ShoDB20IniStre(11:end,1),'k-','LineWidth',1.0)
hold on
plot(MidDB20IniStre(11:end,3),MidDB20IniStre(11:end,1),'k--','LineWidth',1.0)
plot(LonDB20IniStre(11:end,3),LonDB20IniStre(11:end,1),'k-.','LineWidth',1.0)

plot(ShoDB20IniStreReal(11:end,3),ShoDB20IniStreReal(11:end,1),'r-','LineWidth',1.0)
plot(MidDB20IniStreReal(11:end,3),MidDB20IniStreReal(11:end,1),'r--','LineWidth',1.0)
plot(LonDB20IniStreReal(11:end,3),LonDB20IniStreReal(11:end,1),'r-.','LineWidth',1.0)
legend('L/r=49.4','L/r=103.3','L/r=156.3')
% xlim([0 0.04])
% ylim([0 0.4])
xlabel('rad') 
ylabel('P (kips)')
max(ShoDB20IniStre(:,1))
max(MidDB20IniStre(:,1))
max(LonDB20IniStre(:,1))

max(ShoDB20IniStreReal(:,1))
max(MidDB20IniStreReal(:,1))
max(LonDB20IniStreReal(:,1))