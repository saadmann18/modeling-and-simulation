% Problem sheet 8, sample code for 2(b)
clear all; clf

x=-4:0.02:4;  % Define the complex plane of h*lambda.
y=-4:0.02:4;

f=@(x,y) sqrt((1+x)^2+(y)^2);  % Explicit Euler method
for i=1:length(x)
    for j=1:length(y)
        if f(x(i),y(j))<1
            z(j,i)=1;
        else z(j,i)=0;
        end  
    end
end

imagesc(x,y,z);    % plot the stability region
title('Explicit Euler method');
xlabel ('Re(lambda*h)');
ylabel ('Im(lambda*h)');
axis equal;

% By default, imagesc plots the y-axis from lowest to highest value, 
% top to bottom. To reverse this, type:
set(gca,'YDir','normal');