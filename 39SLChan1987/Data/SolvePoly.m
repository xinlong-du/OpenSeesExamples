clear;clc;
fun = @f; % function
x0 = 279561.8; % initial point
z = fzero(fun,x0)

syms P;
Pcr=(P-279561.8)*(P-6.4*10^6)*(P-1.16*10^6)-P*P*(P-6.4*10^6)*0.187863-P*P*(P-1.16*10^6)*0.227799;
Pcr2=simplify(Pcr);
Pcr3=vpa(Pcr2,8);

r=roots([0.584338 -6372991.8 9.5374872e12 -2.0754668e18])