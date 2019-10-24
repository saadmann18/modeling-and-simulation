clear all;
close all;
clc;

grav = 9.81;
dydt = @(t,y,cd,m) ([y(2);grav-cd/m*y(2)*abs(y(2))]);
dsds = @(t,y,varargin) ([y(1);1;0]);
opts=odeset('events', dsds);
y0 = [0, -250];

[t,y,te,ye] = ode45(dydt, [0 inf], y0, opts, 0.0216, 3);
te, ye
plot(t,-y(:,1), '-', t, y(:,2), '--', 'LineWidth', 2)
legend('height', 'velocity')
xlabel('time');
ylabel('height and velocity')