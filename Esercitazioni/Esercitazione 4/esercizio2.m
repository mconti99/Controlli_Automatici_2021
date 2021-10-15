s=tf('s');
G=5/(s*(s+20));
%rlocus(G)
L=100*G;
F=L/(1+L);
step(F, 4)

rltool(G)