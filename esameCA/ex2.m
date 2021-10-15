clc;
close all;
clear all;

%Variabile complessa
num=[1 1];
den=[1 9 18];
sys=tf(num, den);

p=pole(sys)