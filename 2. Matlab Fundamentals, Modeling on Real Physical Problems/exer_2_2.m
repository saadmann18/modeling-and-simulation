clear all;
close all;
clc

a = [3 1 5 -4 2 8];
b = [7 1 0 2 3 6];

x1 = a < b
x2 = a > b
x3 = a == b
x4 = a~=b

c = [x1 x2 x3 x4]


c1 = a>6 & b>6
c2 = a>6 | b>6



