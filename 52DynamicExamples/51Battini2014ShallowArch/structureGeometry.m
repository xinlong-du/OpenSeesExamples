clear;clc;
L=20;
R=20;
x=-L/2:L/21:L/2;
y=sqrt(R*R-x.*x);
plot(x,y)
axis equal
fileID1=fopen('nodes.tcl','w');
for i = 1:length(x)
    fprintf(fileID1,'%4s %2i %12.8f %12.8f %3.1f%1s\n','node',i,x(i),y(i),0.0,';');
end
fclose(fileID1);