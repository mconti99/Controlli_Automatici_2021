%Variabile complessa
s = tf('s');
%% ESERCIZIO 4
k4 = 1; 
L4 = tf([k4],[1 8 12 0]);
theta = linspace(-0.5*pi,0.5*pi);
amp = 0.1;
tfnum = k4;
intinf = amp*exp(j.*theta);
tfden = intinf.*(amp*exp(j.*theta)+2).*(amp*exp(j.*theta)+6);
tfreal = real(tfnum./tfden);
tfimag = imag(tfnum./tfden);
figure(10)

plot(tfreal,tfimag,'r--');
axis([-2 2 -2 2]); 
hold on;

nyquist(L4,{0.1,100});
axis('equal');
hold off

%Funzione di sensitività complementare
F4 = feedback(L4,1);
figure(11)
step(F4);

%Luogo delle radici
figure(12)
rlocus(L4); 