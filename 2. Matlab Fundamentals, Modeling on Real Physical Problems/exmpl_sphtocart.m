clear all;
close all;
clc

theta = linspace(0,2*pi);
phi = linspace(-pi/2, pi/2);
[theta, phi] = meshgrid(theta,phi);
rho = 2;
[x,y,z] = sph2cart(theta,phi,rho);
plot3(x,y,z,'LineStyle','none', 'Marker','o')