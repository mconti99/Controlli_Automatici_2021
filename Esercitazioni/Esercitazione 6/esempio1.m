clc;
close all;
clear all;

%Variabile complessa
s = tf('s');

%PROGETTO A
%Regolatore con r=0, quindi solo guadagno di anello
k = 8;
%Controllore statico
C1 = k; 
%Valutiamo a ciclo chiuso
L1 = C1*G;
figure(1)
margin(L1);grid on;
%Costruiamo una funzione L* che approssima il comportamento desiderato,
%ottenendo poi C2(s) come rapporto L*/L1
%Polo in bassa frequenze e due poli in alta
Lstar = 80/((1+250*s)*(1+0.4*s)^2);
figure(2)
bode(L1);
hold on;
grid on;
margin(Lstar)
%Controllore statico e dinamico: Cs*Cd
C2 = 8*Lstar*(1/L1);



%%
%PROGETTO B
%Per diminuire la complessità del controllore potrei eliminare solo due dei
%tre poli, lasciando quello in alta frequenza che meno incide sul ritardo
%di fase
C3 = C1*((1+10*s)*(1+5*s))/((1+250*s)*(1+0.4*s));
L3 = C3*G;
figure(3)
hold on;
bode(L1);
grid on;
margin(L3);
%%
%PROGETTO C
%Se non ci sono particolari controindicazioni nell'aumentare la banda
%passante, con tutte le problematiche studiate
C4 = C1*((1+5*s)*(1+s))/((1+0.02*s)^2);
L4 = C4*G;
figure(4)
hold on;
bode(L1);
grid on;
margin(L4);
%%
%PROGETTO D
%Poniamo Cs con un polo nell'origine e guadagno k libero
Cs = 1/s;
L5 = Cs*G;
figure(5)
margin(L5);
grid on;
hold on;
%Dai punti precedenti, si comincia a cancellare il polo in bassa frequenza
L6 = Cs*(1+10*s)*G;
margin(L6)
%Cancelliamo anche l'altro polo e poniamo un polo in alta frequenza
L7 = Cs*((1+10*s)*(1+5*s))/((1+s))*G;
margin(L7)
figure(6);
margin(L7)
grid on;
hold on;
%Guadagno in fase aggiungendo un guadagno k = 0.025
L8 = 0.025*L7;
margin(L8)

C5 = 0.025*Cs*((1+10*s)*(1+5*s))/((1+s)); 

%%
%Confronto regolatori
figure(10)
bode(C2)
hold on;
bode(C3);
grid on;
bode(C4);
bode(C5);

%%
%Funzioni di sensitività complementare
F2 = (C2*G)/(1+C2*G);
F3 = L3/(1+L3);
F4 = L4/(1+L4);
F8 = L8/(1+L8);


figure(20)
hold on;
step(F2);
step(F3);
step(F4);
step(F8);
