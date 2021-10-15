s=tf('s');
G=(s+2)/(s^2+2*s+2);
rlocus(G);
L=3.4*G;
F=L/(1+L);
step(F);

%rltool(G);