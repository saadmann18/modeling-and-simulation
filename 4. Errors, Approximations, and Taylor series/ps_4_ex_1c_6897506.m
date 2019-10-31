clc;
clear all;
close all;
%1(c) Write a Matlab program that finds the largest single precision floating point number
%     of x = 2?n for which the representation of 1:0 + x numerically equals 1:0 and print its
%     approximate decimal value. Compare this value with the Matlab constant \eps" for single
%     precision floating point numbers (see help). Derive how many mantissa bits single precision
%     floating point numbers have in Matlab. (2P)

for i = 1:100							
	x = 2^(-i);
	a = 1.0 + x;
	if a == 1.0
		fprintf('The maximum number is : %d \n', i);
		fprintf('The approximate decimal value is : %d \n', x);
		break
	end
end

if x>eps
    disp('The number x is greater than machine epsilon') 
    elseif x==eps
    disp('The number x is equal to the machine epsilon')
    else
disp('The number x is lesser than the machine epsilon')
end

n=0;
while (floor(x*10^n)~=x*10^n)
    n=n+1;
end
fprintf('The number of mantissa bits in a floating point number is : %d \n', n);

%IEEE standard 754 is used