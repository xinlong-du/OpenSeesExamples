clear;clc;
DispNR6dof=load('6dofCantileverDispNR.out');
%DispNR7dof=load('CantileverDispNR.out');
DispNR6dofNew=load('NewDisp6dofCantileverDispNR.out');
figure
plot(DispNR6dof(:,1),DispNR6dof(:,4),'k','LineWidth',1)
hold on
%plot(DispNR7dof(:,1),DispNR7dof(:,4),'b')
plot(DispNR6dofNew(:,1),DispNR6dofNew(:,4),'r--','LineWidth',1)
%legend('DispNR6dof','DispNR7dof','DispNR6dofNew')
legend('DispNR6dof','DispNR6dofNew')
xlabel('t (s)','FontSize',10) 
ylabel('Disp. (in)','FontSize',10)
%%
DispCD6dof=load('6dofCantileverDispCD.out');
DispCD7dof=load('CantileverDispCD.out');
figure
plot(DispCD6dof(11:102646,1),DispCD6dof(11:102646,4))
hold on
plot(DispCD7dof(11:108844,1),DispCD7dof(11:108844,4))