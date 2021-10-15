clc;
close all;
clear all;

%Variabile complessa
s = tf('s');
G=1/(s^2+6*s+5);
C1=15/s;
C2=(s+1);
L=C1*C2*G;
margin(L)
