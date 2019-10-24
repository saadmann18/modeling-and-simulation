clear all;
close all;
clc

p = 1.2;    
A = 0.09;   % Cross Sec Area
cw = 0.4;   % Numerial Drag Co-efficient
k = 0.0216;  %0.25 %0.0216
g = 9.81;     
m = 3;      % Mass of projectile
v(1) = 250; 
z(1) = 0;
z1(1)= 0;
v1(1)=0;

for t = 1:1:14
    v1(t+1)=abs(-sqrt((g*m)/k)*tanh(sqrt(k*g/m)*t));  %analytical 
    v(t+1) = abs(v(t) + 1* (g-(k/m)*v(t)*abs(v(t))));    %euler

    z1(t+1) = abs((-m/k)*log(cosh(t*sqrt(k*g/m))));%analytical
    z(t+1) = abs(z(t)+1*m/k*log(cosh(t*sqrt(k*g/m))));%euler
    
    VT(t+1) = sqrt((m*g)/k);%terminal velocity
    
    z1(t+1) = abs((-m/k)*log(cosh(t*sqrt(k*g/m))));%analytical
    
     T1 = sqrt(m/k*g)*acosh(exp(z*k/m));%time for highiest point
     
     
     T2 = sqrt(m/k*g)*acosh(exp(-z*k/m));%time to reach the surface
    
    
    
    end
t = 0:14;

semilogy(t,v,'g',t,v1,'k--',t,z,'r:',t,z1,'c-.',t,VT,'m--',t,T1,t,T2)

xlabel('Time (seconds)')
ylabel('Velocity')
title(' Velocity time')
