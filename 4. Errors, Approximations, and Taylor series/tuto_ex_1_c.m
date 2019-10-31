%ex 4_1c
%(a)write a matlab program that finds the largest single precision
%floating point number of x=2^-n for which the representation
%of 1.0+x numerically equals to 1.0 and print its approximate
%decimal value.

clear all;

n=0;
while not(single(1.0+2^(-n))==1.0)
    n = n+1;
end
x12=2^(-n);
fprintf('(a) n=%d, x12=2^(-%d)=%1.20e\n', n, n, x12);
    %it gives n=24 bits & the largest x for
    %which 1+x==1 is x=5.96046447753906250000e-08
%%
%(b)compare this value with the Matlab constant "eps" for
%single precision floating point numbers.

x_eps=eps('single');
fprintf('(b) Matlab eps(\''single\'')=%1.20e\n', x_eps);
    %eps('single') is the distance from 1.0 to 
    %the next larger single floating point number: 
    %x_eps=1.19209289550781250000e-07

%%
%Derive how many mantissa bits single precion floating point
%numbers have in Matlab.
bits = n-1; %it gives n=23 bits, so mantiss n_m=23 bits, and the smallest
x=2^(-bits);%x for which 1+x not 1 is x=2^-23=1.19209289550781250000e-07
fprintf('computed eps bits=%d, x=%1.20e\n', bits, x);

