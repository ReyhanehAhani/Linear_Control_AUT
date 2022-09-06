clear all;
close all;
A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
C=[1 0.05];
D=[1 0.0088];
lag = tf(C,D);
sys = feedback(lag * Plant ,1);
t = 0:0.1:10 ;
figure;
rlocus(Plant);
figure;
rlocus(lag*Plant);
figure2 = step (sys , t);
figure;
plot(figure2)
stepinfo(sys)

%% step info plant
F = [64.11];
G =[1 36.42 0];
Plant = tf(F,G);
stepinfo(plant)
%% ki&kp&kd
A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
C=[1 0.05];
D=[1 0.0088];
lag = tf(C,D);
PID= feedback(lag * Plant ,1);
syms Kp Kd Ki N
NPID_num=[Kp+N*Kd Kp*N+Ki N*Ki];
NPID_den=[1 N 0];
eqn1=PID.Numerator{1}(1)==NPID_num(1);
eqn2=PID.Numerator{1}(2)==NPID_num(2);
eqn3=PID.Numerator{1}(3)==NPID_num(3);
eqn4=PID.Denominator{1}(2)==NPID_den(2);
solx=vpasolve([eqn1 eqn2 eqn3 eqn4]);
Kp=subs(Kp,solx.Kp)
Kd=subs(Kd,solx.Kd)
Ki=subs(Ki,solx.Ki)
N=subs(N,solx.N)
%% pid tunner
A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
C=[1 0.05];
D=[1 0.0088];
lag = tf(C,D);
sys = feedback(lag * Plant ,1);
pidtool(sys)



