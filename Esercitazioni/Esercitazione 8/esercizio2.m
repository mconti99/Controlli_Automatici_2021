s=tf('s');
Giniz=1/((s/0.5+1)*(s+1)*(s/2+1));
figure(1);
bode(Giniz);
hold on; grid on;

K=3;
G=K*Giniz;
margin(G);
hold on;
C2=3*(11.11*s+1)/(33.33*s+1);
L=C2*G;
figure(2);
margin(L);