clear;clc;
%% 1 element
exact = csvread('exact.csv');
displ = csvread('displ.csv');
mixed = csvread('mixed.csv');
DB1ele1sec1=load('DB1DefoEle1sec1.out');
DB1ele1sec2=load('DB1DefoEle1sec2.out');
DB1ele1sec3=load('DB1DefoEle1sec3.out');
DB1ele1sec4=load('DB1DefoEle1sec4.out');
DB1ele1sec5=load('DB1DefoEle1sec5.out');
DB1ele1sec6=load('DB1DefoEle1sec6.out');
DB1ele1sec7=load('DB1DefoEle1sec7.out');
MB1ele1sec1=load('MB1DefoEle1sec1.out');
MB1ele1sec2=load('MB1DefoEle1sec2.out');
MB1ele1sec3=load('MB1DefoEle1sec3.out');
MB1ele1sec4=load('MB1DefoEle1sec4.out');
MB1ele1sec5=load('MB1DefoEle1sec5.out');
MB1ele1sec6=load('MB1DefoEle1sec6.out');
MB1ele1sec7=load('MB1DefoEle1sec7.out');
MB1ele1fromForce=load('MB1DefoEle1fromForce.out');
DB1curv=[DB1ele1sec1(100,3);DB1ele1sec2(100,3);DB1ele1sec3(100,3);DB1ele1sec4(100,3);DB1ele1sec5(100,3);...
    DB1ele1sec6(100,3);DB1ele1sec7(100,3)];
MB1curv=[MB1ele1sec1(100,3);MB1ele1sec2(100,3);MB1ele1sec3(100,3);MB1ele1sec4(100,3);MB1ele1sec5(100,3);...
    MB1ele1sec6(100,3);MB1ele1sec7(100,3)];
MB1curvFromForce=MB1ele1fromForce(100,3:3:21)';
ele1Lobatto=0.5*([-1.0;-0.8302238962;-0.4688487934;0.0;0.4688487934;0.8302238962;1.0]+1);
hfig=figure;
plot(exact(:,1),exact(:,2),'k-','LineWidth',1.0)
hold on
plot(displ(:,1),displ(:,2),'k--','LineWidth',1.0)
plot(mixed(:,1),mixed(:,2),'k-.','LineWidth',1.0)
plot(ele1Lobatto,DB1curv,'r--','LineWidth',1.0)
plot(ele1Lobatto,MB1curv,'r-.','LineWidth',1.0)
plot(ele1Lobatto,MB1curvFromForce,'b-.','LineWidth',1.0)
legend({'Exact','DB1Alemdar','MB1Alemdar','DB1Lobatto','MB1Lobatto','MB1LobattoFromeForce'},'FontSize',10)
legend('Location','south')
xlabel('x/L','FontSize',10) 
ylabel('Curvature','FontSize',10)
xlim([0 1])
ylim([0 0.0004])
set(gca,'XTick',(0:0.2:1))
set(gca,'YTick',(0:0.0001:0.0004))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test1.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');
%% 2 elements
exact2 = csvread('exact2.csv');
displ2 = csvread('displ2.csv');
mixed2 = csvread('mixed2.csv');
DB2ele1sec1=load('DefoEle1sec1.out');
DB2ele1sec2=load('DefoEle1sec2.out');
DB2ele1sec3=load('DefoEle1sec3.out');
DB2ele1sec4=load('DefoEle1sec4.out');
DB2ele1sec5=load('DefoEle1sec5.out');
DB2ele1sec6=load('DefoEle1sec6.out');
DB2ele1sec7=load('DefoEle1sec7.out');
DB2ele2sec1=load('DefoEle2sec1.out');
DB2ele2sec2=load('DefoEle2sec2.out');
DB2ele2sec3=load('DefoEle2sec3.out');
DB2ele2sec4=load('DefoEle2sec4.out');
DB2ele2sec5=load('DefoEle2sec5.out');
DB2ele2sec6=load('DefoEle2sec6.out');
DB2ele2sec7=load('DefoEle2sec7.out');
MB2ele1sec1=load('MB2DefoEle1sec1.out');
MB2ele1sec2=load('MB2DefoEle1sec2.out');
MB2ele1sec3=load('MB2DefoEle1sec3.out');
MB2ele1sec4=load('MB2DefoEle1sec4.out');
MB2ele1sec5=load('MB2DefoEle1sec5.out');
MB2ele1sec6=load('MB2DefoEle1sec6.out');
MB2ele1sec7=load('MB2DefoEle1sec7.out');
MB2ele2sec1=load('MB2DefoEle2sec1.out');
MB2ele2sec2=load('MB2DefoEle2sec2.out');
MB2ele2sec3=load('MB2DefoEle2sec3.out');
MB2ele2sec4=load('MB2DefoEle2sec4.out');
MB2ele2sec5=load('MB2DefoEle2sec5.out');
MB2ele2sec6=load('MB2DefoEle2sec6.out');
MB2ele2sec7=load('MB2DefoEle2sec7.out');
MB2ele1fromForce=load('MB2DefoEle1fromForce.out');
MB2ele2fromForce=load('MB2DefoEle2fromForce.out');
DB2curv=[DB2ele1sec1(100,3);DB2ele1sec2(100,3);DB2ele1sec3(100,3);DB2ele1sec4(100,3);DB2ele1sec5(100,3);DB2ele1sec6(100,3);DB2ele1sec7(100,3);...
    DB2ele2sec1(100,3);DB2ele2sec2(100,3);DB2ele2sec3(100,3);DB2ele2sec4(100,3);DB2ele2sec5(100,3);DB2ele2sec6(100,3);DB2ele2sec7(100,3)];
MB2curv=[MB2ele1sec1(100,3);MB2ele1sec2(100,3);MB2ele1sec3(100,3);MB2ele1sec4(100,3);MB2ele1sec5(100,3);MB2ele1sec6(100,3);MB2ele1sec7(100,3);...
    MB2ele2sec1(100,3);MB2ele2sec2(100,3);MB2ele2sec3(100,3);MB2ele2sec4(100,3);MB2ele2sec5(100,3);MB2ele2sec6(100,3);MB2ele2sec7(100,3)];
MB2curvFromForce=[MB2ele1fromForce(100,3:3:21) MB2ele2fromForce(100,3:3:21)]';
% DB2Legendre1=0.5*0.5*([-0.949107912342759;-0.741531185599394;-0.405845151377397;0.0;0.405845151377397;0.741531185599394;0.949107912342759]+1);
% DB2Legendre=[DB2Legendre1;DB2Legendre1+0.5];
ele2Lobatto1=0.5*0.5*([-1.0;-0.8302238962;-0.4688487934;0.0;0.4688487934;0.8302238962;1.0]+1);
ele2Lobatto=[ele2Lobatto1;ele2Lobatto1+0.5];
hfig=figure;
plot(exact2(:,1),exact2(:,2),'k-','LineWidth',1.0)
hold on
plot(displ2(:,1),displ2(:,2),'ks--','LineWidth',1.0)
plot(mixed2(:,1),mixed2(:,2),'ko-.','LineWidth',1.0)
plot(ele2Lobatto,DB2curv,'rs--','LineWidth',1.0)
plot(ele2Lobatto,MB2curv,'ro-.','LineWidth',1.0)
plot(ele2Lobatto,MB2curvFromForce,'bo-.','LineWidth',1.0)
legend({'Exact','DB2Alemdar','MB2ALemdar','DB2Lobatto','MB2Lobatto','MB2LobattoFromForce'},'FontSize',10)
legend('Location','south')
xlabel('x/L','FontSize',10) 
ylabel('Curvature','FontSize',10)
xlim([0 1])
ylim([0 0.0004])
set(gca,'XTick',(0:0.2:1))
set(gca,'YTick',(0:0.0001:0.0004))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('test2.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');