%Name of the student: Saad Bin Abdul Mannan
%Matriculation Number: 6897506
%Course: Electrical Systems Engineering
%Homework on Modeling and Simulation problem sheet 2

clear all;
close all;
clc

%%                            
%1
x=diag(3,-3)+diag([1 1],-2)+diag([7 7 7],-1)+diag([6 6 6 6])+diag([-4 -4 -4],1)+diag([-2 -2],2)+diag(9,3);
%%
%2
a = [3 1 5 -4 2 8];
b = [7 1 0 2 3 6];

x1 = a < b
x2 = a > b
x3 = a == b
x4 = a~=b

c = [x1 x2 x3 x4]


c1 = a>6 & b>6
c2 = a>6 | b>6
%%
x =diag(3,-3)+diag([1 1],-2)+diag([7 7 7],-1)+diag([6 6 6 6])+diag([-4 -4 -4],1)+diag([-2 -2],2)+diag(9,3); ;             %3a
    
y = 6.*x;

min = y(1);              %3b
for i = 2:numel(y)
    if y(i)<min
        min = y(i);
    end
end
min
max = y(1);
k = 1;                      %3c
while (k < 16)
    if y(k)>max
        max = y(k); 
    end
    k = k+1;
end
max

syms k x                    %3d
f1 = symsum(k,k,1,6)
ans
f1 =21

f2 = symsum(k^2,k,1,6)
ans
f2 =91

f3 = symsum(k^3,k,1,6)
ans
f3 =441

%%           
[a,b] = ps_2_ex_4a_6897506(2,3,6)     %4(a)

%comparing the solution
%with results from the MATLAB function "root".

%Given equation
%2*x^2+3*x+6

syms x;
p = 2*x^2+3*x+6;
q = root(p,x)
S_vpa = vpa(q)

%comment: 'root' function generates higher decimal value on imaginary
%part of the complex value.

r = 6;                    %4b
theta = pi.*rand(1000,6);
phi = 2*pi.*rand(1000,6);

[theta, phi] = meshgrid(theta,phi);
[x,y,z] = ps_2_ex_4b_6897506(r,theta,phi);

plot3(x,y,z,'LineStyle','none','Marker','o' )
title('Cartisian co-ordinate')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
legend('Length','Width', 'Height')
grid on

%%
%5

%in lecture, there were many examples that can be modeled on Real Physical phenomena.
%
%To model an LC circuit, the following categories should be kept in mind:(1,4,7,13,14,16,20).
%  
%Traffic light system falls into categories with physical,abstract,real time,continuous,realistic,artificial,complex,deterministic,stochastic, statistical properties of input known
%
%Metabolic processes in a cell agrees with physical,dynamic,continuous,realistic,natural,complex,stochastic,unknown input.


