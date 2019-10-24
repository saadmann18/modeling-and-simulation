clear all;
%close all;
clc

p = 1.2;    
A = 0.09;   % Cross Sec Area
cw = 0.4;   % Numerial Drag Co-efficient
k = 0.0216;  %0.25 %0.0216
g = 9.81;     
m = 3;      % Mass of projectile
z(1) = 0; 

% t1 = 0:1:30;
for t = 1:300
        z(t+1) = z(t) + 1* ((m/k)*log(cosh(t*sqrt(k*g/m))));%Forward Euler Formula
%         z(t) = abs(z(t));
        
end



t = 0:300;
plot (t,z)
xlabel('Time (seconds)')
ylabel('Velocity')
title(' Velocity time')

% syms v(t)
% ode = diff(v,t) == g-(k/m)*(-250).^2;
% ySol(t) = abs(dsolve(ode))
% 
% t = 0:30;
% plot (t,v)
% hold on
%  plot(t,ySol(t))