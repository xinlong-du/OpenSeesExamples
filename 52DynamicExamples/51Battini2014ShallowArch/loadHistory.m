clear;clc;
time=0:0.001:0.5;
load=sin(10*time);
plot(time,load)
%format long;
fileID1=fopen('Fz.txt','w');
for i = 1:length(time)
    fprintf(fileID1,'%11.8f\n',load(i));
end
fclose(fileID1);