clear all
close all
clc

x(1) = 1;
y(1) = 0;

xFE(1) = 1; %Intial value of x(t)=x(0)=1 for Forward Euler method
yFe(1) = 0;		%Intial value of y(t)=y(0)=0 for Forward Euler method

xB(1) = xFE(1); %Intial value of x(t) for Backward Euler method
yB(1) = yFe(1); %Intial value of y(t) for Backward Euler method

xSI(1) = xFE(1); %Intial value of x(t) for Semi-Implicit method
ySI(1) = yFe(1); %Intial value of y(t) for Semi-Implicit method

xRK1(1) = xFE(1); %Intial value of x(t) for Runge-Kutta method resp
yRK1(1) = yFe(1);   %Intial value of y(t) for Runge-Kutta method resp

xRK2(1) = xFE(1); %Intial value of x(t) for Runge-Kutta method resp
yRK2(1) = yFe(1);	%Intial value of y(t) for Runge-Kutta method resp

xTR(1) = xFE(1); %Intial value of x(t) for Trapizoidal method
yTR(1) = yFe(1); %Intial value of y(t) for Trapizoidal method

xTR2(1) = xFE(1); %Intial value of x(t) for Trapizoidal method
yTR2(1) = yFe(1); %Intial value of y(t) for Trapizoidal method

h1 = 0.2;		%step size 1
h2 = 0.5;		%STEP SIZE 2

for i=1:51

    %Fwd Euler method
    xFE(i+1) = xFE(i) + h1 * yFe(i);
    yFe(i+1) = yFe(i) - h1 * xFE(i);

    %Bwd Euler method
    xB(i+1) = (1/(1+h1^2)) * xB(i) + (h1/(1+h1^2)) * yB(i);
    yB(i+1) = (1/(1+h1^2)) * yB(i) - (h1/(1+h1^2)) * xB(i);


    %Semi-Implicit method h=0.2
    xSI(i+1) = xSI(i) + h1 * ySI(i);
    ySI(i+1) = (1-h1^2)*ySI(i) - h1 * xSI(i);
    
    %Trapizoidal method h=0.2
    xTR(i+1)=((1-0.25*h1^2)*xTR(i)+h1*yTR(i))/((1+0.25*h1^2));
    yTR(i+1)=((4-h1^2)*yTR(i)-4*h1*xTR(i))/(4+h1^2);
    
    %Trapizoidal method h=0.5
    xTR2(i+1)=((1-0.25*h2^2)*xTR2(i)+h2*yTR2(i))/((1+0.25*h2^2));
    yTR2(i+1)=((4-h2^2)*yTR2(i)-4*h2*xTR2(i))/(4+h2^2);


    %Runge-Kutta method with h = 0.2
    xK1_1 = yRK1(i);			% Approximate for x gives approx for derivative
    yK1_1 = -xRK1(i);		% Approximate for y gives approx for derivative
    xK2_1 = yRK1(i) + 0.5 * h1 * yK1_1; 		% Approximate derivative at intermediate value
    yK2_1 = -(xRK1(i) + 0.5 * h1 * xK1_1);	% Approximate derivative at intermediate value
    xRK1(i+1) = xRK1(i) + h1 * xK2_1;		% Approximate solution at next value of x
    yRK1(i+1) = yRK1(i) + h1 * yK2_1;		% Approximate solution at next value of y

    %Runge-Kutta method with h = 0.5
    xK1_2 = yRK2(i);			% Approximate for x gives approx for derivative
    yK1_2 = -xRK2(i);		% Approximate for y gives approx for derivative
    xK2_2 = yRK2(i) + 0.5 * h2 * yK1_2; 		% Approximate derivative at intermediate value
    yK2_2 = -(xRK2(i) + 0.5 * h2 * xK1_2);	% Approximate derivative at intermediate value

    xRK2(i+1) = xRK2(i) + h2 * xK2_2;		% Approximate solution at next value of x
    yRK2(i+1) = yRK2(i) + h2 * yK2_2;		% Approximate solution at next value of y

end

%Unit Circle 
theta = linspace(0,2*pi,50);
xCir = cos(theta);
yCir = sin(theta);



%Plot 1 with Forward Euler method, Backward Euler method and the Semi-Implicit method along with a Unit Circle

figure(1);
plot(xFE, yFe, 'b-x', xB, yB, 'r--o', xSI, ySI, 'g:+', xCir, yCir, 'k-.*')
title('Comparison of stability of Forward Euler method, Backward Euler method and Semi-Implicit method using the Unit Circle');
xlabel('x(t) ');
ylabel('y(t) ');
legend('Forward Euler method','Backward Euler method','Semi-Implicit method','Unit Circle','Location','Northwest')

%Plot 2 with the Semi-Implicit method and the Runge-Kutta method(with h = 0.5) along with a Unit Circle

figure(2);
plot(xSI, ySI, 'b-x', xRK2, yRK2, 'r--*', xCir, yCir, 'go')
title('Comparison of stability of Semi-Implicit method and the Runge-Kutta method(h = 0.5) using the Unit Circle');
xlabel('x(t) ');
ylabel('y(t) ');
legend('Semi-Implicit method','Runge-Kutta method','Unit Circle','Location','Northwest')

%Plot 3 with the Semi-Implicit method and the Runge-Kutta method(with h = 0.5) along with a Unit Circle

figure(3);
plot(xSI, ySI, 'b-x', xRK1, yRK1, 'r--*', xCir, yCir, 'go')
title('Comparison of stability of Semi-Implicit method and the Runge-Kutta method (h = 0.2) using the Unit Circle');
xlabel('x(t) ');
ylabel('y(t) ');
legend('Semi-Implicit method','Runge-Kutta method','Unit Circle','Location','Northwest')

figure(4);
plot(xSI, ySI, 'b-x', xTR, yTR, 'r--*',xTR2, yTR2, 'g:+', xCir, yCir, 'k-o')
title('Comparison of stability of Semi-Implicit method and the Trapizoidal method(h = 0.2) using the Unit Circle');
xlabel('x(t) ');
ylabel('y(t) ');
legend('Semi-Implicit method','Trapizoidal method(h=0.2)','Trapizoidal method (h=0.5)','Unit Circle','Location','Northwest')