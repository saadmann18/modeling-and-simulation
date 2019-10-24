clear all;
% close all;
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


for t = 1:8
   z(t+1) = (m/k)*log(cosh(t*sqrt(k*g/m)));%analytical
%     z(t+1) = abs(z(t)+1*m/k*log(cosh(t*sqrt(k*g/m))));%euler
%     

end

t = 0:8;
plot(t,z,'r:')
% plot(t,v,'g',t,v1,'k--',t,z,'r:',t,z1,'c-.',t,VT,'m--',t,T1,t,T2)
xlabel('Time (seconds)')
ylabel('vertical position along z axis')
title(' position')
legend('vertical Euler scheme', 'vertical Analytical Solution','Location','southeast')