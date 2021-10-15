num=[ 4 8];
den=conv(conv([2 1], [2 1]), conv([0.125 1], [0.125 1]));
sys=tf(num, den);
figure(1);
margin(sys)
[Gm, Pm, Wcg, Wcp]=margin(sys);
Tc=2*pi/Wcg;

kp=Gm/2; %tuning P
L=kp*sys;
F=feedback(L, 1);
figure(2);
step(F);
%non ottengo il regime richiesto, ho delle sovraelongazioni

kp=0.45*Gm;
Ti=0.8*Tc;
contr=tf([kp*Ti kp], [Ti 0]); %controllo PI
L=contr*sys;
F=feedback(L,1);
figure(3);
step(F);
%ho errore nullo, ma ho oscillazioni

%fai il controllore PID
s=tf('s');
kp=0.6*Gm;
Ti=0.5*Tc;
Td=0.125*Tc;
contr=((kp*Ti*s+kp+kp*Ti*Td*s^2)/(Ti*s));
L=contr*sys;
F=feedback(L,1);
figure(4);
step(F);
%ho errore nullo, poche sovraelongazioni e un piccolo settling time