clear
clc

A=[-7 1; -12 0];
B=[0;1];
C=[1 0; 0 1];
D=zeros(2,1);
x0=[0;0];

Di=eig(A);
%il sistema a ciclo aperto presenta 2 autovalori reali negativi
% ->l'andamento del sistema a ciclo aperto sarà
%aperiodico convergente

Co=ctrb(A, B);
r=rank(Co); %il sistema è controllabile

P=[-0.2+j -0.2-j]; %vettore dei poli desiderati
K=place(A, B, P);
Ahat=A-B*K;
L_star=eig(Ahat);

Ob=obsv(A,C);
r1=rank(Ob); %il sistema è osservabile