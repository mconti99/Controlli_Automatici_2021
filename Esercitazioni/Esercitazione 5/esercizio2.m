%Variabile complessa
s = tf('s');
%% ESERCIZIO 2
k2 = 1;
L2 = k2*(1-s)/(((s+1)^2)*(s+5));
figure(4)
nyquist(L2);

%Funzione di sensitività complementare
F2 = feedback(L2,1);
figure(5)
step(F2);

%Luogo delle radici
figure(6)
rlocus(L2);