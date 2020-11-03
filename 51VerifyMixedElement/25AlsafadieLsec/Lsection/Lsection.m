%% form a fiber section of a L section
clear;clc;
%% input section propertities
% a = length of leg 1 (long)
% b = length of leg 2 (short)
% t = thickness/inch
% nfa = number of fibers along leg 1
% nfb = number of fibers along leg 2
% nft = number of fibers along thickness (assume 1 here)
a=76.0;
b=51.0;
t=6.5;
nfa=13;
nfb=13;
nft=1;
%% torsional stiffness
J=(a+b-t)*t^3/3;
%% calculate coordinates of centroid with respect to the vertex of L section
A=(a+b)*t-t^2; % section area
yc=((a-t)*t*t/2+b*t*b/2)/A; % distance between centroid and vertex in the local y' direction
zc=((b-t)*t*t/2+a*t*a/2)/A; % distance between centroid and vertex in the local z' direction

%% calculate principle axes (rotation from local axes y'-z' to principle axes y-z)
I1y=1/12*t*a^3+(a/2-zc)^2*t*a; % moment of inertia of leg 1 w.r.t. y'
I1z=1/12*a*t^3+(yc-t/2)^2*t*a; % moment of inertia of leg 1 w.r.t. z'
I1yz=0+(a/2-zc)*(yc-t/2)*t*a; % moment of inertia of leg 1 w.r.t. y'-z'
I2y=1/12*(b-t)*t^3+(zc-t/2)^2*t*(b-t); % moment of inertia of leg 2 w.r.t. y'
I2z=1/12*t*(b-t)^3+((b-t)/2+t-yc)^2*t*(b-t); % moment of inertia of leg 2 w.r.t. z'
I2yz=0+(zc-t/2)*((b-t)/2+t-yc)*t*(b-t); % moment of inertia of leg 2 w.r.t. y'-z'
Iy1=I1y+I2y; % moment of inertia of L section w.r.t. y'
Iz1=I1z+I2z; % moment of inertia of L section w.r.t. z'
Iyz1=I1yz+I2yz; % moment of inertia of L section w.r.t. y'-z'
Iy=(Iy1+Iz1)/2+1/2*sqrt((Iy1-Iz1)^2+4*Iyz1^2); % moment of inertia of L section w.r.t. y
Iz=(Iy1+Iz1)/2-1/2*sqrt((Iy1-Iz1)^2+4*Iyz1^2); % moment of inertia of L section w.r.t. y
alpha=atan(-2*Iyz1/(Iz1-Iy1))/2; % rotation from local axes y'-z' to principle axes y-z
alpha=abs(alpha); %make sure alpha is positive at pi/4 (equal legs)
%% calculate fiber coordinates w.r.t. z'-y'
SCcoordz1y1=[zc-t/2;-(yc-t/2)]; % shear center coordinates w.r.t. z'-y'
P=zeros(2,nfa+nfb-1); % fiber coordinates w.r.t. z'-y', first row of P is z', second row of P is y'
dPz=[-a/nfa;0];
dPy=[0;b/nfb];
for i=1:nfa
    P(:,i)=SCcoordz1y1+(i-1)*dPz;
end
for i=1:(nfb-1)
    P(:,nfa+i)=SCcoordz1y1+i*dPy;
end
plot(P(1,:),P(2,:),'.')
axis equal
%% transform fiber coordinates to z-y
T=[cos(alpha),sin(alpha);
    -sin(alpha),cos(alpha)]; % transformation matrix
Q=T*P; % first row of Q is z, second row of Q is y
figure
plot(Q(1,:),Q(2,:),'.')
axis equal
%% Calculate approximate elastic properties (Iy, Iz, betaY and betaZ)
Af=zeros(nfa+nfb-1,1); % area of each fiber
Af(1)=a/nfa*b/nfb-(a/nfa-t)*(b/nfb-t);
Af(2:nfa)=a/nfa*t;
Af(nfa+1:nfa+nfb-1)=b/nfb*t;

Qsquared=Q.^2;
IyIz_appr=Qsquared*Af; % approximate to [Iy;Iz]

QsumCol=sum(Qsquared,1); % calculate y^2+z^2
QsumColz=Q(1,:).*QsumCol; % calculate z(y^2+z^2)
QsumColy=Q(2,:).*QsumCol; % calculate y(y^2+z^2)
betaY=QsumColz*Af/Iy-2*Q(1,1);
betaZ=QsumColy*Af/Iz-2*Q(2,1);

%% output Tcl command lines to generate fiber sections
fileID1=fopen('Lsection.tcl','w');
%fprintf(fileID,'%7s %5s %5i %1s\n','section','Fiber',10000+secID,'{');
for i = 1:(nfa+nfb-1)
%                                                                          %fiber %yLoc  %zLoc   Area    MaterialID  SectorialCoord ys, and zs of shear center
    fprintf(fileID1,'    %5s %16.8f %16.8f %16.8f %6s%1s\n','fiber',Q(2,i),Q(1,i),Af(i),'$matID',';');
end
fclose(fileID1);

%% output L section properties
fileID=fopen('LsectionProperties.tcl','w');
                                           % ys     zs     
fprintf(fileID,'%16.8f %16.8f %16.8f %16.8f\n',Q(2,1),Q(1,1),alpha,J);
fclose(fileID);

%% calculate polar radius of gyration
r02=Q(2,1)^2+Q(1,1)^2+(Iy+Iz)/A;
r0=sqrt(r02);