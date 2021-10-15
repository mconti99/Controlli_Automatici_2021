s=tf('s');
G=(s+2)/(s+1)(s-1);
rlocus(G);
L=7*G;
F=L/(1+L);
step(F,4);

%rltool(G);