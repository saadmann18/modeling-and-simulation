clear all;
close all;
clc

x = [6 -4 -2 9;
    7 6 -4 -2;
    1 7 6 -4;
    3 1 7 6];
y = 6.*x

result = y(1);
for i = 2:numel(y)
    if y(i)<result
        result = y(i);
    end
end
result

