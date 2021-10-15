clear
clc
%definire il sistema
A=[0 1; 0 -2];
B=[ 0; 1];
C = eye(2);
D=zeros(2,1);
%la mia specifica mi impone di piazzare gli autovalori a ciclo chiuso in -2+-j
L = eig(A); %gli autovalori a ciclo aperto sono 0 e -2 -> la specifica non è soddisfatta

%il sistema è controllabile?
Co = ctrb (A, B);
r=rank(Co); % la matrice di controllabilità ha rangio pieno -> il sistema è controllabile

P=[-2+j -2-j]; %vettore contenente i poli desiderati

%tecnica del piazzamento dei poli mediante il comando place

K=place(A, B, P);

%verifico che il sistema a ciclo chiuso soddisfi la specifica
Ahat = A-B*K;
L_star=eig(Ahat)