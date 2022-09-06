clear all;
close all;
clc
s = tf('s');
A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
% K = 43.63;
K = 100;
Z = 75.21;
pd =  K *(s + Z);
% pd = pid (43.63*75.21,0,75.21);
% pidTuner(Plant , pd)
sys = feedback(pd * Plant ,1);
% t = 0:0.1:10 ;
% figure;
% rlocus(Plant);
% figure;
% rlocus(pd*Plant);
% figure2 = step (sys , t);
% figure;
% plot(figure2)
stepinfo(sys)

