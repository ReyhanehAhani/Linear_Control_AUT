A = [0 0 1 0; 0 0 0 1 ; 0 600 -35 0 ; 0 -1256 35 0];
B = [0 ;0 ;62 ;-62];
C = [1 0 0 0 ; 0 0 0 0];
D = [0 ; 0];
p =[-50;-50;-10+10i;-10-10i];
k=[12.2935 -43.2549 1.566 -0.2144];
Anew= A-B*k;
acker (A,B,p)

%% root
s=tf('s');
plant = (61.07*s^2+40120) / (s^4 + 34.69*s^3 + 1252*s^2+ 22790*s)
rlocus (plant)
can=canon (plant,'companion')
a_ccontrollable = can.a