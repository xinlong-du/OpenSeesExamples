clear;clc;
DispEnd4LayerFz=load('DispEnd4LayerFz.out');
DispEnd8LayerFz=load('DispEnd8LayerFz.out');
DispEnd8LayerFz10ele=load('DispEnd8LayerFz10ele.out');
DispEnd8LayerFz20ele=load('DispEnd8LayerFz20ele.out');
DispEnd8LayerFz40ele=load('DispEnd8LayerFz40ele.out');
DispEnd4LayerFzOO=load('DispEnd4LayerFzOriginOpenSees.out');
DispEnd4LayerFzOO10ele=load('DispEnd4LayerFzOriginOpenSees10ele.out');
DispEnd8LayerFzOO40ele=load('OriOPSDispEnd8LayerFz40ele.out');

YDispEnd8LayerFz40ele=load('YDispEnd8LayerFy40ele.out');

%% plot Fz vs disp. z
figure
plot(DispEnd4LayerFz(1:15000,4),DispEnd4LayerFz(1:15000,1))
hold on
plot(DispEnd8LayerFz(1:15000,4),DispEnd8LayerFz(1:15000,1),'*','MarkerIndices',(1:500:15000))
plot(DispEnd8LayerFz10ele(1:15000,4),DispEnd8LayerFz10ele(1:15000,1))
plot(DispEnd8LayerFz20ele(1:15000,4),DispEnd8LayerFz20ele(1:15000,1),':')
plot(DispEnd8LayerFz40ele(1:15000,4),DispEnd8LayerFz40ele(1:15000,1))
plot(DispEnd4LayerFzOO(1:15000,4),DispEnd4LayerFzOO(1:15000,1))
plot(DispEnd4LayerFzOO10ele(1:15000,4),DispEnd4LayerFzOO10ele(1:15000,1))
plot(DispEnd8LayerFzOO40ele(1:15000,4),DispEnd8LayerFzOO40ele(1:15000,1),'--')

plot(YDispEnd8LayerFz40ele(1:15000,3),YDispEnd8LayerFz40ele(1:15000,1),'.','MarkerIndices',(1:500:15000))

legend('DB5-4LayerFz','DB5-8LayerFz','DB10-8LayerFz','DB20-8LayerFz','DB40-8LayerFz',...
    'DB5-4LayerFzOO','DB10-4LayerFzOO','DB40-8LayerFzOO','Y-DB40-8LayerFz')
xlabel('mm') 
ylabel('N')
