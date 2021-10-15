clear
clc

A=[0 1; -5 -1];
B=[0;1];
C=[1 0; 0 1];
D=zeros(2,1);
x0=[0;0];
%studio del sistema a ciclo aperto->analizzo la risposta indiciale
%simulink e valuto gli autovalori della matrice dinamica A

Di=eig(A);
%il sistema a ciclo aperto presenta autovalori complessi e coniugati con
%parte reale negativa->l'andamento del sistema a ciclo aperto sarà pseudo
%periodico convergente

%valuto la controllabilità
Co=ctrb(A, B);
r=rank(Co); %il rango è pieno e quindi il sistema è controllabile

P=[-2 3];%vettore dei poli desiderati
K=place(A, B, P);

%la matrice dinamica a ciclo chiuso sarà Ahat
Ahat=A-B*K;
L_star=eig(Ahat);

%verificare in simulink se la specifica è soddisfatta
%verificare l'osservabilità del sistema
Ob=obsv(A,C);
r1=rank(Ob); %il rango è pieno e quindi il sistema è osservabile

