clear;clc;
DispNR6dof=load('6dofCantileverDispNR.out');
DispNR7dof=load('CantileverDispNR.out');
figure
plot(DispNR6dof(:,1),DispNR6dof(:,4))
hold on
plot(DispNR7dof(:,1),DispNR7dof(:,4))

% DispCD6dof=load('6dofCantileverDispCD.out');
% DispCD7dof=load('CantileverDispCD.out');
% figure
% plot(DispCD6dof(11:102646,1),DispCD6dof(11:102646,4))
% hold on
% plot(DispCD7dof(11:108844,1),DispCD7dof(11:108844,4))