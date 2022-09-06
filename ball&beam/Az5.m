clc;
clear;
close all;
Kbb = 7.005;
Pbb = tf ([Kbb] , [1 0 0]);
Kp = 1.25;
Kv = 0.6;
f = tf ([Kv 0] , [1]);
PV = Kp * feedback (Pbb ,f);
sys = feedback (PV ,1);
t = 0:0.1:10 ;
figure (1)
rlocus(Pbb);
figure (2)
rlocus(PV);
figure (3)
step (sys , t);
stepinfo(sys)