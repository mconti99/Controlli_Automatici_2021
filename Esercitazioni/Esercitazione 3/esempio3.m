clear
clc

A=[-1 -2; 1 -1];
B=[0;1];
C=[1 0];
D=0;

l=eig(A); %mi aspetto che il sistema a ca coverge oscillando
%verificare la completa controllabilità
Con=ctrb(A,B);
r=rank(Con); %sistema è controllabile

%verificare completa osservabilità
Ob=obsv(A,C);
r1=rank(Ob); %il sistema è osservabile

%nell'ipotesi di stato accessbile, progetto una retroazione di stato che
%garantisca assenza di oscillazioni e tempo di sassstamento di 1 un secondo

K=place(A,B, [-5 -15]);
Ahat=A-B*K;
lstar=eig(Ahat);
%verificare in simulink il sistema a ciclo chiuso nell'ipotesi di stato
%accesibile

%nell'ipotesi di stato non accessibile progetto un osservatore che
%assisesti in 0.1s, quindi i poli desiderati dell'osservatore sono -50 e
%-60

L=place(A', C', [-50 -60])';
%costruisco le matrici dell'osservatore
Ao=A-L*C;
Bo=[B L];
Co=eye(2);
Do=zeros(2,2);