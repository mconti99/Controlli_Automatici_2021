sys=tf([1 2], conv([1 1],[1 5]));
%einf=0 per r(t)=1(t), ta<=1s, s%<10%, attenuazione del 90% dei rumori di misura nella frequenza 100-1000
%il modulo dei rumori deve essere più piccolo di 0.1
sisotool(sys)
%la vorrei così 1/s(s+5)
%metodo del loop shaping: la mia L(s) per avere l'attraversamento a wc=5
%deve avere un solo polo in corrispondenza di una frequenza tale per cui il
%mio ts è <1