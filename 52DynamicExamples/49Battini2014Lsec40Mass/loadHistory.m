clear;clc;
time=0:0.000625:8;
load=sin(5*time);
%format long;
fileID1=fopen('loadHistory.txt','w');
for i = 1:length(time)
    fprintf(fileID1,'%11.8f\n',load(i));
end
fclose(fileID1);
plot(time,load)