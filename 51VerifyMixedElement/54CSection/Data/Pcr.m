clear;clc;
A=335.0127;
Iy=155792.2732;
Iz=376274.4954;
Iw=198824773.2232;
J=285.8775;
y0=0.0000;
z0=-49.1399;
E=201500;
nu=0.3;
G=E/(2*(1+nu));
L=2000;

r2squ=(Iy+Iz)/A+y0*y0+z0*z0;
r0squ=(Iy+Iz)/A;

Nz=pi^2*E*Iz/(L^2);
%Ny=pi^2*E*Iy/(L^2);

NxW=(G*J+pi^2*E*Iw/(L^2))/r2squ;
Nx=(G*J)/r2squ;

NcrW=(NxW+Nz-sqrt((NxW+Nz)^2-4*NxW*Nz*r0squ/(r0squ+z0^2)))/2/r0squ*(r0squ+z0^2)
Ncr=(Nx+Nz-sqrt((Nx+Nz)^2-4*Nx*Nz*r0squ/(r0squ+z0^2)))/2/r0squ*(r0squ+z0^2)