clc;
clear;
close all;
%% parameters
syms s
A = [0,0,1,0;0,0,0,1;0,480.19231,-24.94238,0;0,-836.90659,28.0193,0];
B = [0;0;49.32173;-49.32173];
D = [0;0];
eig(A)
ts = 0 : 0.00001 :5;
ti = 0 : 0.00001 :1.5;
%% theta & alpha responses
C1 = [1,0,0,0;0,1,0,0];
P1 = ss(A,B,C1,D);
figure(1)
step(P1,ts);
figure(2)
impulse(P1,ti);
%% alpha plant
C2 = [0,0,0,0;0,1,0,0];
[a2,b2] = ss2tf(A,B,C2,D);
P2 = tf(a2(2:2:10),b2)
%% theta plant
C = [1,0,0,0;0,0,0,0];
[a,b] = ss2tf(A,B,C,D);
plant = tf(a(1:2:10),b)
figure(3)
rlocus(plant);
figure(4)
step(plant,ts);
figure(5)
impulse(plant,ti);
%% lead Controller
K = 4.21831;
G1 = K * plant;
figure(6)
bode(G1);
figure(7)
bode(plant);
T = 0.16809;
alpha = 0.34697;
lead = K * tf([T 1],[T*alpha 1]);
sys = lead * plant;
figure(6)
bode(sys);