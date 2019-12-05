clc
clear all
close all 

xa=0;
xb=1;
fa=0;
fb=2;
Nx=10;

dx=(xb-xa)/(Nx-1);

A=zeros(Nx);
for i=2:Nx-1
    A(i,i)=-(((2+2*i*dx)/(dx^2))+8);
    A(i,i+1)=((1+i*dx)/(dx^2))+(1/(2*dx));
    A(i,i-1)=((1+i*dx)/dx^2)-(1/(2*dx^2));   
end
A(1,1)=1;
A(Nx,Nx)=1
b=zeros(Nx,1)
b(1)=0.02
b(end)=1

f=A\b;
f(1);
f(end);
t=0:dx:1;
plot(t,f)
title('Finite Differential Method');
xlabel('Xi ');
ylabel('Y(Xi) ');
    


