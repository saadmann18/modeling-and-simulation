clear all;
close all;
clc

a1 = [(6*diag(ones(4)))];
a2 = a1(2:end)-10;
a3 = a1(3:end)-8;
a4 = [9];
b1 = a1(2:end)+1;
b2 = a1(3:end)-5;
b3 = [3];

x1 = diag(a1)+diag(a2,1)+diag(a3,2)+diag(a4,3);
x2 = diag(b1,-1)+diag(b2,-2)+diag(b3,-3);

z = x1+x2