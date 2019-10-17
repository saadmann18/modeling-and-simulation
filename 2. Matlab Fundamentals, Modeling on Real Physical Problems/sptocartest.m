clear all;
close all;
clc

rho = 6;
theta = pi.*rand(1000*6,1);
phi = 2*pi.*rand(1000*6,1);


[theta, phi] = meshgrid(theta,phi);
[x,y,z] = ps_2_ex_4b_6897506(rho,theta,phi);
plot3(x,y,z,'LineStyle','none','Marker','o' )
grid on
title('Cartisian co-ordinate')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
legend('Length','Width', 'Height')
