clear
clc

A=[0 1; 0 -2];
B=[0; 1];
C=[1 0];
D=0;

%analisi del sistema a ciclo aperto, verifico gli autovalori della matrice
%dinamica A 
l=eig(A);
%verifica in simulink
%progetto osservatore che consenta la stima della seconda variabile di
%stato e che abbia poli in -10+j e -10-j 
%il sistema è osservabile?
Ob=obsv(A,C);
r=rank(Ob);
L=place(A',C', [-10+j -10-j])';

Ao=A-L*C;
Bo=[B L];
Co=eye(2);
Do=zeros(2,2);

%verifico specifica ossercatore
lo=eig(Ao);