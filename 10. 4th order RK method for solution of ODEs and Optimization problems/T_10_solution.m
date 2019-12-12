clc
clear all
close all
clf

mu1  = 400; %coefficient for preys, critical point.
mu2  = 300; %coefficient for preys, critical point.
eta1 = 500; %initial condition, number of preys :     400 325
eta2 = 200; %initial condition, number of predatiors: 100 200
y0 = [eta1;eta2];
t = 0:0.1:8*pi; %get time step and interval

%inline function for LotkaVolterra model
LotkaVolterra = @(t,y) [y(1)*(1-y(2)/mu2);-y(2)*(1-y(1)/mu1)];

[t1,ya] = ode_rk4(LotkaVolterra,t,y0);  %call own 4th order RK method function.
[t2,yb] = ode45(LotkaVolterra,t,y0);    %call matlab 4th order RK method function.

plot(t1,ya(:,1),'-r',t1,ya(:,2),'-b',t2,yb(:,1),'ro',t2,yb(:,2),'bo',...
    'LineWidth',1,'MarkerSize',4);

legend('Number of preys(My 4th Oder RK)', 'Number of predetors(My 4th Oder RK)',...
    'Number of prays(Matlab ODE45 RK)', 'Number of predetors(Matlab ODE45 RK)');
title('Plot 4th order RK solution of predator prey population');
xlabel('Time in years');
ylabel('Number of preys and predetors');

figure;
plot(mu1,mu2,'bo',eta1, eta2,'ro'); 
hold on; 
pause(2); 
comet(ya(:,1),ya(:,2));
title('plot 4th oder RK solution of predetor-pray papulation')
xlabel('Number of prays');
ylabel('Number of predetor');