s=tf('s');
G=10/(s*((s/2.5)+1)*((s/6)+1));
C1=5;
L1=C1*G;
margin(L1);
%margine di fase negativo, elimino cioè che sta in bassa frequenza
C2=(5*((s/2.5)+1))/(1+s*0.001);
L2=C2*G;
margin(L2);
%margine di fase troppo basso, provo ad eliminare tutta la dinamica
%aggiungendo un polo doppio in alta frequenza per la fisica realizzabilità
C3=(5*((s/2.5)+1)*((s/6)+1))/(1+s*0.001)^2;
L3=C3*G;
margin(L3);
F=feedback(L3,1);
figure(2);
step(3*F);%risposta al gradino ampio 3