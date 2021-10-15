clear
clc

%descrizione sistema a ciclo aperto
A=[-2 1; -2 0];
B=[0; 1];
C=eye(2);
D=zeros(2,1);
x0=[0;0];

%progettare un controllo pole-placement tale da posizionare gli autovalori
%del sistema a ciclo chiuso in -3+-j235

Co = ctrb(A, B);
r=rank(Co); %il rango è pieno -> il sistema è controllabile

L=eig(A); %la specifica non è soddisfatta perchè gli autovalori del sistema di partenza sono -1+-j
P=[-3+j*25; -3-j*25]

K=acker(A, B, P);
%verifico che le specifiche con questo tuning di K siano state soddisfatte
Ahat = A-B*K;
L_star=eig(A-B*K);
