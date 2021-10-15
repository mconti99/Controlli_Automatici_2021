clear
clc

A=-5;
B=1;
C=1;
D=0;
x0=0;

Di=eig(A);
Co=ctrb(A, B);
r=rank(Co); %sistema controllabile
P=-7; %polo desiderato
K=place(A, B, P);
Ahat=A-B*K;
L_star=eig(Ahat);
