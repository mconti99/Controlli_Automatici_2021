clear
clc

A=[0 1; 2 1];
B=[0; 1];
C=eye(2);
D=zeros(2,1);

%verifichiamo se il sistema è controllabile
Co=ctrb(A, B);
r=rank(Co); %il rango è pieno e quindi il criterio di controllabilità è soddisfatto

%voglio progettare un'azione di feedback tale da stabilizzare il mio
%sistema a ciclo chiuso
L=eig(A); %le specifiche non sono soddisfatte
%scelgo i poli desiderati in -1 e -10 (arbitrario)
P = [-1 -10];
K=place(A, B, P);
Ahat= A-B*K;
L_star=eig(Ahat);
