clc
clear all
close all
clf
V = 1000;
x(1) = 10;  %x-side length in cm
y(1) = 10;  %y-side length in cm
z(1) = V/x(1)/y(1); %express Z interms of X and Y
A(1) = x(1)*y(1)+2*V/y(1)+2*V/x(1); %Surface area(bottom, front, back, left, right)
gamma = 0.01; %step size
N = 200;    %number of steps

for i=1:N-1     %grad A = (d/dx,d/dy)=(y-2v/x^2, x-2v/y^2)
    dx = y(i)-2*V/(x(i)*x(i));
    dy = x(i)-2*V/(y(i)*y(i));
    x(i+1) = x(i)-gamma*dx; %Gradient decent method in x
    y(i+1) = y(i)-gamma*dy; %Gradient decent method in y
    z(i+1) = V/(x(i+1)*y(i+1));
    A(i+1) = x(i+1)*y(i+1)+2*V/y(i+1)+2*V/x(i+1);
end 
subplot(2,1,1);
plot(1:N,x,'-r',1:N, y,'ob',1:N,z,'-g'); 
grid on
legend('x','y','z');
title('Optimization of minimum material requirements','Color','b');
xlabel('Number of steps(N)','Color','b');
ylabel('x,y,z(cm)', 'Color','b');

subplot(2,1,2);
plot(1:N,A);
xlabel('Number of steps(N)','Color','b');
ylabel('Area of the box(cm^2)','Color','b');