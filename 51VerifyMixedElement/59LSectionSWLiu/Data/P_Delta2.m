clear;clc;
L72=load('L72End.out');
L72exp=csvread('L72exp.csv');
L72shell=csvread('L72shell.csv');
L72liu=csvread('L72liu.csv');
L60=load('L60End.out');
L60exp=csvread('L60exp.csv');
L60shell=csvread('L60shell.csv');
L60liu=csvread('L60liu.csv');
L48B=load('L48BEnd.out');
L48Bexp=csvread('L48Bexp.csv');
L48Bshell=csvread('L48Bshell.csv');
L48Bliu=csvread('L48Bliu.csv');
L48A=load('L48AEnd.out');
L48Aexp=csvread('L48Aexp.csv');
L48Aliu=csvread('L48Aliu.csv');
%% plot L72
hfig=figure;
plot(-2*L72(11:end,2),L72(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L72exp(:,1),L72exp(:,2),'ko','LineWidth',1.0)
plot(L72shell(:,1),L72shell(:,2),'k-.','LineWidth',1.0)
plot(L72liu(:,1),L72liu(:,2),'k--','LineWidth',1.0)
legend('DB10','Exp.','shell','Liu et al.')
legend('Location','southeast')
xlim([0 6.0])
ylim([0 350])
xlabel('Axial shortening (mm)') 
ylabel('Applied force (kN)')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('L72.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% plot L60
hfig=figure;
plot(-2*L60(11:end,2),L60(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L60exp(:,1),L60exp(:,2),'ko','LineWidth',1.0)
plot(L60shell(:,1),L60shell(:,2),'k-.','LineWidth',1.0)
plot(L60liu(:,1),L60liu(:,2),'k--','LineWidth',1.0)
legend('DB10','Exp.','shell','Liu et al.')
legend('Location','southeast')
xlim([0 6.0])
ylim([0 400])
xlabel('Axial shortening (mm)') 
ylabel('Applied force (kN)')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('L60.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% plot L48B
hfig=figure;
plot(-2*L48B(11:end,2),L48B(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L48Bexp(:,1),L48Bexp(:,2),'ko','LineWidth',1.0)
plot(L48Bshell(:,1),L48Bshell(:,2),'k-.','LineWidth',1.0)
plot(L48Bliu(:,1),L48Bliu(:,2),'k--','LineWidth',1.0)
legend('DB10','Exp.','shell','Liu et al.')
legend('Location','southeast')
xlim([0 6.0])
ylim([0 400])
xlabel('Axial shortening (mm)') 
ylabel('Applied force (kN)')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('L48B.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% plot L48A
hfig=figure;
plot(-2*L48A(11:end,2),L48A(11:end,1),'k-','LineWidth',1.0)
hold on
plot(L48Aexp(:,1),L48Aexp(:,2),'ko','LineWidth',1.0)
plot(L48Aliu(:,1),L48Aliu(:,2),'k--','LineWidth',1.0)
legend('DB10','Exp.','Liu et al.')
legend('Location','southeast')
xlim([0 6.0])
ylim([0 400])
xlabel('Axial shortening (mm)') 
ylabel('Applied force (kN)')
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('L48A.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');