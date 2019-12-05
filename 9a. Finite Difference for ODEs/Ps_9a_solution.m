clear all
close all
clc

L = 1.0 %Length of domain
yb = 1  %Boundary condition of right boundary yb(x=1)=1
h = 0.1 %step size in xi
n = round(L/h); %number of unknowns; the last y(n+1) = 1 from b.c. y(1) = 1
h = L/n; %corrected step size
x = 0:h:L; %x includes xmin = 0 and xmax = 1 at boundaries, however, for calculation, the 
            %last element is not needed since solution is known at the
            %right boundary.
d(1) = -(2*(h+2)*(1+x(1))+15*h^2);
d(2:n) = -(4*(1+x(2:n))+16*h^2);

%from vector of subdiagonal elements
subd = 2*(1+x(2:n))-h;
%from vector of supdiagonal elements
supd(1) = 4*(1+x(1));
supd(2:n-1) = 2*(1+x(2:n-1))+h;

%create LHS matrix a which has a tridiagonal structure
a = diag(d,0) + diag(subd,-1) + diag(supd,1);
%create RHS vector b [ay = b]
b(n,1) = -(2*(1+x(n))+h);
%solve system of linear equation i.e. find vector y
y = a\b;    %aY = b; => Y = a^-1.b
y(n+1) = yb

plot(x,y); 
xlabel('X'); 
ylabel('Y')
