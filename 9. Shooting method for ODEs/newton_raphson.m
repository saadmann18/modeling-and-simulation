clear all;
close all
clc

x0 = 0;
e=10^(-4);

for i = 1:100
    x1 = x0-(f1(x0)/f2(x0));
    if abs(x1-x0)<=e
        break;
    else
        x0 = x1;
    end
end
