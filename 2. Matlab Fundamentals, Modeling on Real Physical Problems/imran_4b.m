clear all;
close all
clc

az = 2*pi*rand (1000,4);
el = pi*rand(1000,4);
r = 4*ones (1000,4);

[x,y,z] = ps_2_ex_4b_6883240(az,el,r);

figure, plot3(x,y,z, '-. o')

% x = 0 : 4;
% y = x;
% % creates meshgrid to be used in 3D plot
% [x,y] = meshgrid(vx,vy);
% mesh (x,y);

title('Cartisian co-ordinate')
xlabel('X')
ylabel('Y')
zlabel('Z')
legend('Length','Width', 'Height')
grid on