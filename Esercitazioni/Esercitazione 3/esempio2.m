clear
clc

A=[-1 -4; 1 -1];
B=[0;1];
C=[1 0];
D=0;

%verifico gli autovalori del sistema a ciclo aperto
l=eig(A);

%il sistema è controllabile?
Con=ctrb(A,B);
r=rank(Con); %il rango è pieno e quindi il sistema è controllabile

%il sistema è osservabile?
Ob=obsv(A,C);
r1=rank(Ob); %sistema osservabile

%progettazione della retroazione di stato nell'ipotesi di stato accessibile
K=place(A,B, [-2 -10]);
Ahat=A-B*K;
lstar=eig(Ahat);
%nell'ipotesi di stato non accessibiel, progetto l'osservatore con
%autovalori in -10 e -20

L=place(A',C',[-100 -200])';

Ao=A-L*C;
lo=eig(Ao);
Bo=[B L];
Co=eye(2);
Do=zeros(2,2);