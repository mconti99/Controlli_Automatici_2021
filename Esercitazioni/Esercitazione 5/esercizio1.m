%Variabile complessa
s = tf('s');


%% ESERCIZIO 1
k1 = 1;

L1 = k1(1)/(((s+1)^2)*(s+10));
figure(1)
nyquist(L1);

%Funzione di sensitività complementare 
F1 = feedback(L1,1);
figure(2)
step(F1);

%Luogo delle radici
figure(3)
rlocus(L1);
