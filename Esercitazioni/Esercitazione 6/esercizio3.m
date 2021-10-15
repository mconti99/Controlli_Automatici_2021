clc;
close all;
clear all;

%Variabile complessa
s = tf('s');
G=(1/(s^2+2*s+2));
C1=1/s
L1=C1*G
%figure(1);
%margin(L1);
%grid on;
C2=(1+s)/((1+0.1*s)*(s));
L2=C2*G;
%figure(2);
%margin(L2);
%grid on;
C3=(350*(1+s)*(s^2+2*s+2))/((1+0.1*s)*(1+100*s)*(s));
L3=C3*G;
%figure(3);
%margin(L3);
%grid on;
C4=(s^2+2*s+2)/(s*(1+s/100));
L4=C4*G;
figure(4);
margin(L4);
grid on;


