clear all
close all
clc
p = 1.2;    
A = 0.09;   % Cross Sec Area
cw = 0.4;   % Numerial Drag Co-efficient
k = 0.0216;  %0.25 %0.0216
g = 9.81;     
m = 3;      % Mass of projectile
v(1) = -250;
% 
% t = sqrt(m/(k*g))*acosh(exp(-z*k/m));
t = 0:300;
    for t = 1:300
    z = (-m/k)*log(cosh(t*sqrt(k*g)/m));
    end
    plot(t,z)

