%frhs   = filename.m is m-file
%tspan  = 1*N matrix of t values
%y0     = n*1 matrix of initial conditions
%returns tspan = t, y = N*n matrix.
%Implements RK 4th order algorithm(ode_rk4.m)
function [tspan,y] = ode_rk4(frhs,tspan,y0)
N = length(tspan);
n = length(y0);
y0 = reshape(y0,n,1);
y = [y0 zeros(n,N-1)];
w = y0;
for i=1:N-1
    h = tspan(i+1) - tspan(i);  %time difference
    t=tspan(i);
    k1=frhs(t,w);
    k2=frhs(t+h/2,w+h*k1/2);
    k3=frhs(t+h/2,w+h*k2/2);
    k4=frhs(t+h,w+h*k3);
    w=w+h*(k1+2*k2+2*k3+k4)/6;
    y(:,i+1)= w;
end
y=y';
tspan=tspan';
end