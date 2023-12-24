clear;clc;
A=530.1884;
Iy=280199.1137;
Iz=3238929.3646;
Iw=2311204143.9981;
J=396.8994;
y0=0.0000;
z0=-44.0832;
E=200000;
nu=0.3;
G=E/(2*(1+nu));
L=6604;

r2squ=(Iy+Iz)/A+y0*y0+z0*z0;
r0squ=(Iy+Iz)/A;

Nz=pi^2*E*Iz/(L^2);
%Ny=pi^2*E*Iy/(L^2);

NxW=(G*J+pi^2*E*Iw/(L^2))/r2squ;
Nx=(G*J)/r2squ;

NcrW=(NxW+Nz-sqrt((NxW+Nz)^2-4*NxW*Nz*r0squ/(r0squ+z0^2)))/2/r0squ*(r0squ+z0^2)
Ncr=(Nx+Nz-sqrt((Nx+Nz)^2-4*Nx*Nz*r0squ/(r0squ+z0^2)))/2/r0squ*(r0squ+z0^2)

NcrFTBw=sqrt((pi^2*E*Iy/L^2)*(G*J+pi^2*E*Iw/L^2))/(4448.2216*25.4)
NcrFTB =sqrt((pi^2*E*Iy/L^2)*(G*J))/(4448.2216*25.4)