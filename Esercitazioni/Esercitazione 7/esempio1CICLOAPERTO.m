num=[ 4 8];
den=conv(conv([2 1], [2 1]), conv([0.125 1], [0.125 1]));
sys=tf(num, den);
figure(1);
step(sys); %ho un andamento monotono crescente, posso applicare z-n a ciclo aperto
mu=8; %valore a cui tende la step(sys)
tau=0.3; %quando il grafico supera 0.1
T=3.1;

%implemento il PI
s=tf('s');
kp=1.2*(T/(mu*tau));
Ti=2*tau;
Td=tau/2;
contr=((kp*Ti*s+kp+kp*Ti*Td*s^2)/(Ti*s));
L=contr*sys;
F=feedback(L,1);
figure(2);
step(F);
%ho einf=0, ma ho sovraelongazioni del 60% (arriva fino a 1.6)