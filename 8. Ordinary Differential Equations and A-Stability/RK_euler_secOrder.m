clear all;
close all;
clc

x=-4:0.02:4;  % Define the complex plane of h*lambda.
y=-4:0.02:4;

%Runge-Kutta 2nd order (Mid Point)
f=@(x,y) sqrt((1+x+y*i+(x^2+y^2*i^2+2*x*y*i)/2)*(1+x-y*i+(x^2+y^2*i^2-2*x*y*i)/2));

%f=@(x,y) sqrt((1+x)^2+(y)^2); % Forward Euler


for i=1:length(x)
    for j=1:length(y)
        if f(x(i),y(j))<1
            z(j,i)=1;
        else z(j,i)=0;
        end  
    end
end
subplot(1,2,1)
imagesc(x,y,z);   % plot the stability region
title('2nd order explicit RK ');
xlabel ('Re(lambda*h)');
ylabel ('Im(lambda*h)');
axis equal;

f=@(x,y) sqrt((1+x)^2+(y)^2); % Forward Euler

for i=1:length(x)
    for j=1:length(y)
        if f(x(i),y(j))<1
            z(j,i)=1;
        else z(j,i)=0;
        end  
    end
end

subplot(1,2,2)
imagesc(x,y,z);   % plot the stability region
title('Explicit Euler method');
xlabel ('Re(lambda*h)');
ylabel ('Im(lambda*h)');
axis equal;

% By default, imagesc plots the y-axis from lowest to highest value, 
% top to bottom. To reverse this, type:
set(gca,'YDir','normal');