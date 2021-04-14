clear;clc;
%% load-rotation curve
plasDB2End=load('plasDB2End.out');
plasMB2End=load('plasMB2End.out');
figure
plot(plasDB2End(:,7),plasDB2End(:,1))
hold on
plot(plasMB2End(:,7),plasMB2End(:,1))
legend({'DB2','MB2'},'FontSize',10)
%% 2 elements
DB2ele1sec1=load('plasDB2DefoEle1sec1.out');
DB2ele1sec2=load('plasDB2DefoEle1sec2.out');
DB2ele1sec3=load('plasDB2DefoEle1sec3.out');
DB2ele1sec4=load('plasDB2DefoEle1sec4.out');
DB2ele1sec5=load('plasDB2DefoEle1sec5.out');
DB2ele1sec6=load('plasDB2DefoEle1sec6.out');
DB2ele1sec7=load('plasDB2DefoEle1sec7.out');
DB2ele2sec1=load('plasDB2DefoEle2sec1.out');
DB2ele2sec2=load('plasDB2DefoEle2sec2.out');
DB2ele2sec3=load('plasDB2DefoEle2sec3.out');
DB2ele2sec4=load('plasDB2DefoEle2sec4.out');
DB2ele2sec5=load('plasDB2DefoEle2sec5.out');
DB2ele2sec6=load('plasDB2DefoEle2sec6.out');
DB2ele2sec7=load('plasDB2DefoEle2sec7.out');
MB2ele1sec1=load('plasMB2DefoEle1sec1.out');
MB2ele1sec2=load('plasMB2DefoEle1sec2.out');
MB2ele1sec3=load('plasMB2DefoEle1sec3.out');
MB2ele1sec4=load('plasMB2DefoEle1sec4.out');
MB2ele1sec5=load('plasMB2DefoEle1sec5.out');
MB2ele1sec6=load('plasMB2DefoEle1sec6.out');
MB2ele1sec7=load('plasMB2DefoEle1sec7.out');
MB2ele2sec1=load('plasMB2DefoEle2sec1.out');
MB2ele2sec2=load('plasMB2DefoEle2sec2.out');
MB2ele2sec3=load('plasMB2DefoEle2sec3.out');
MB2ele2sec4=load('plasMB2DefoEle2sec4.out');
MB2ele2sec5=load('plasMB2DefoEle2sec5.out');
MB2ele2sec6=load('plasMB2DefoEle2sec6.out');
MB2ele2sec7=load('plasMB2DefoEle2sec7.out');
MB2ele1fromForce=load('plasMB2DefoEle1fromForce.out');
MB2ele2fromForce=load('plasMB2DefoEle2fromForce.out');
DB2curv=[DB2ele1sec1(400,3);DB2ele1sec2(400,3);DB2ele1sec3(400,3);DB2ele1sec4(400,3);DB2ele1sec5(400,3);DB2ele1sec6(400,3);DB2ele1sec7(400,3);...
    DB2ele2sec1(400,3);DB2ele2sec2(400,3);DB2ele2sec3(400,3);DB2ele2sec4(400,3);DB2ele2sec5(400,3);DB2ele2sec6(400,3);DB2ele2sec7(400,3)];
MB2curv=[MB2ele1sec1(400,3);MB2ele1sec2(400,3);MB2ele1sec3(400,3);MB2ele1sec4(400,3);MB2ele1sec5(400,3);MB2ele1sec6(400,3);MB2ele1sec7(400,3);...
    MB2ele2sec1(400,3);MB2ele2sec2(400,3);MB2ele2sec3(400,3);MB2ele2sec4(400,3);MB2ele2sec5(400,3);MB2ele2sec6(400,3);MB2ele2sec7(400,3)];
MB2curvFromForce=[MB2ele1fromForce(400,3:3:21) MB2ele2fromForce(400,3:3:21)]';
ele2Lobatto1=0.5*0.5*([-1.0;-0.8302238962;-0.4688487934;0.0;0.4688487934;0.8302238962;1.0]+1);
ele2Lobatto=[ele2Lobatto1;ele2Lobatto1+0.5];

hfig=figure;
plot(ele2Lobatto,DB2curv,'rs--','LineWidth',1.0)
hold on
plot(ele2Lobatto,MB2curv,'ro-.','LineWidth',1.0)
plot(ele2Lobatto,MB2curvFromForce,'bo-.','LineWidth',1.0)
legend({'DB2','MB2','MB2fromFOrce'},'FontSize',10)
legend('Location','south')
xlabel('x/L','FontSize',10) 
ylabel('Curvature','FontSize',10)
xlim([0 1])
ylim([0 0.001])
set(gca,'XTick',(0:0.2:1))
set(gca,'YTick',(0:0.0002:0.001))
set(gca,'FontSize',10)
% save figure
figWidth=3.5;
figHeight=3;
set(hfig,'PaperUnits','inches');
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout=('testInelas.');
print(hfig,[fileout,'tif'],'-r800','-dtiff');