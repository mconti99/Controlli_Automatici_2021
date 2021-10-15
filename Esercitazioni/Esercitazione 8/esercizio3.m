s=tf('s');
G=0.1*exp(-3*s)*1/((1+5*s)*(1+20*s));
Kp=43.5;
Ki=1.74;
Kd=174;
N=1000;

C= Kp+Ki/s+(Kd*s)/(1+(Kd/(Kp*N))*s);
L=C*G;
margin(L);
