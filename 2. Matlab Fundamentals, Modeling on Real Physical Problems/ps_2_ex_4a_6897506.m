%Name of the student: Saad Bin Abdul Mannan
%Matriculation Number: 6897506
%Course: Electrical Systems Engineering
%Homework on Modeling and Simulation problem sheet 2

function [x1, x2] = ps_2_ex_4a_6897506(a,b,c)

m = sqrt(b.^2-4*a.*c);
n = 2*a;

x1 = (-b+m)./n;
x2 = (-b-m)./n;