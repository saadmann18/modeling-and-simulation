clear all;
close all;
clc

p = 1.2;    
A = 0.09;   % Cross Sec Area
cw = 0.4;   % Numerial Drag Co-efficient
k = 0.0216;   %0.0216
g = 9.81;     
m = 3;      % Mass of projectile
v(1) = -250; 
z(1) = 0;
z1(1)= 0;
v1(1)=250;

for t = 1:30
    v(t+1) = v(t) + 1*(g-(k/m)*v(t)*abs(v(t)));         %euler
    v(t) = abs(v(t));
    
    v1(t+1)=sqrt((g*m)/k)*tanh(sqrt(k*g/m)*t);          %analytical
    
    z(t+1) = (m/k)*log(cosh(t*sqrt(k*g/m)));            %analytical
    z(t+1) = abs(z(t)+1*m/k*log(cosh(t*sqrt(k*g/m))));  %euler
    
    VT(t+1) = sqrt((m*g)/k);                            %terminal velocity
    
    z1(t+1) = abs((-m/k)*log(cosh(t*sqrt(k*g/m))));     %analytical ztop
    
    T1 = sqrt(m/k*g)*acosh(exp(z*k/m));                 %time for highiest point
    T2 = sqrt(m/k*g)*acosh(exp(-z*k/m));                %time to reach the surface
%     
end

t = 0:30;
figure;
plot(t, v, 'b', t, v1, 'k--', t, z, 'r:')
figure;
plot(t, v, 'g', t, v1, 'k--', t, z, 'r:', t, z1, 'c-.', t, VT, 'm--', t, T1, t, T2)
xlabel('Time (seconds)')
ylabel('Velocity')
title(' Velocity time')
legend('Velocity using Euler scheme', 'Velcity Using Analytical Solution','Location','northeast')