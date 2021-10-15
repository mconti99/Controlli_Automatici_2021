clear
clc

A=[0 1; -25 0];
B=[0;1];
C=[0 1];
D=0;

l=eig(A); %autovalori in 5j e -5j, mi aspetto un comportamento oscillatorio periodico
r=rank(ctrb(A,B));
r1=rank(obsv(A,C));
%sistema completamente controllabile e osservabile
K=place(A,B, [-1 -10]);
Ahat=A-B*K;
lstar=eig(Ahat);

%supponiamo che l'osservatore abbia poli in -50 e -100
L=place(A', C', [-50 -100])';
Ao=A-L*C;
lo=eig(Ao);
Bo=[B L];
Co=eye(2);
Do=zeros(2,2);