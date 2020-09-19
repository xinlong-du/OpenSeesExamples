clear;clc;
time=0:0.0005:1;
load=sin(50*time);
%format long;
fileID1=fopen('Fz.txt','w');
for i = 1:length(time)
    fprintf(fileID1,'%11.8f\n',load(i));
end
fclose(fileID1);