clear all;
close all;
clc
p = 1.2;    
A = 0.09;   % Cross Sec Area of Pumpkin
cw = 0.4;   % Numerial Drag Co-efficient
k = 1/2*(cw*p*A);
g = 9.81;     
m = 3;      % Mass of pumpkin
v(1) = 0;   %Initial Velocity   

for t = 1:30
    v(t+1) = v(t) + (1) * (g-(k/m)*v(t)^2); %Forward Euler Formula
    VT(t+1) = sqrt((m*g)/k); % Terminal Velocity
end
t = 0:30;
plot (t,v)
hold on
plot (t,VT)
hold off
xlabel('Time (seconds)')
ylabel('Velocity')
title('Differential Velocity VS Terminal Velocity')
legend('Diff Velocity', 'Terminal Velcity','Location','southeast')