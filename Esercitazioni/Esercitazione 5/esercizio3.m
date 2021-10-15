%Variabile complessa
s = tf('s');
%% ESERCIZIO 3
k3 = 1;
L3 = tf([k3],[1 10 0]);
theta = linspace(-0.5*pi,0.5*pi);
amp = 0.1;
tfnum = k3;
intinf = amp*exp(1i.*theta);
tfden = intinf.*(amp*exp(1i.*theta)+10);
tfreal = real(tfnum./tfden);
tfimag = imag(tfnum./tfden);
figure(7)

plot(tfreal,tfimag,'r--');
axis([-2 2 -2 2]); 
hold on;

nyquist(L3,{0.1,100});
axis('equal');
hold off

%Funzione di sensitività complementare
F3 = feedback(L3,1);
figure(8)
step(F3);

%Luogo delle radici
figure(9)
rlocus(L3);