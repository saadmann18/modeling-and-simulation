clc;
clear all;
close all;
g = 9.81;
c = 0.4;
rho = 1.2;
A = 0.09;
k = 0.5*c*rho*A;
m = 3;

vl = 0;                                 %Initial Val x1
diff = 0.5;                             %Final Value ?
G(1) = 10;                              %First guess for NR Method
G(2) = 20;                              %Second guess for NR Method
f = @(t,y) [y(2); -g-(((k/m)*y(1)^2))];      % 1st order ODEs
g = @(x) (x-diff);                      % Deviation from the required Final Value

[t,y] = ode45(f,[0 5],[vl; G(1)]);     % first time step
x(1) = y(end,1);                        %Temporary final value obtained at the first time step

i=2;
while(abs(g(x(i-1)))>0.001)
    [t,y] = ode45(f,[0 1],[vl; G(i)]); % remaining time_step
    x(i) = y(end,1);                    %Temporary final values
    G(i+1) = G(i)-g(x(i))*((G(i)-G(i-1))/(g(x(i))-g(x(i-1)))); % newton method
    i=i+1;
end

fprintf('The loop runs for %d times until the target is reached\n', i);

plot (t,y(:,1),'r')
title('Single Shooting method')
xlabel('t')
ylabel('y(t)')
grid on