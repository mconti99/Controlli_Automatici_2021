clear
clc

A=[-2 1; -2 0];
B=[0;1];
C=eye(2);
D=zeros(2, 1);

Co=ctrb(A, B);
r=rank(Co);
P=[-30+2j -30-2j];
K=place(A, B, P);
Ahat=A-B*K;
L_star=eig(Ahat);