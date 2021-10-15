clc;
close all;
clear all;
s = tf('s');

G = 10/(s*(s+20));



Kd = 0.1;
Ki = 37.5;
Kp = 11.5;

N = 100;

C = Kp + Ki/s + (Kd*s)/(1+(Kd/(Kp*N))*s);

L = C*G;
margin(L);

F = L/(1+L);
F = zpk(minreal(F));
figure(2)
step(F)