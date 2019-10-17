clear all;
close all;
clc

x = [6 -4 -2 9;
    7 6 -4 -2;
    1 7 6 -4;
    3 1 7 6];
y = 6.*x;

result = y(2);%36

k = 1;
while (k < 16)
    if y(k)>result
        result = y(k) 
    end
    k = k+1;
end
