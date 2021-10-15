s=tf('s');
G=50/(s*(s/5+1));
C1=1;
L1=C1*G;
figure(1)
margin(G);
hold on; grid on;
margin(L1);

a=(1-sind(50))/(1+sind(50));
T=1/(sqrt(a)*15.4);

Kc=0.4; %va bene anche 1
%rete anticipatrice
C2=Kc*(1+(s/5.46))/(1+(s/41));
L2=C1*C2*G;
F=L2/(1+L2);
F=zpk(minreal(F)); %trascuro i termini aggiuntivi
margin(L2)
figure(2)
step(F);
