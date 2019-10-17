function [x,y,z] = ps_2_ex_4b_6897506(rho, theta, phi)

x = rho.*cos(phi).*cos(theta);
y = rho*cos(phi).*sin(theta);
z = rho .* sin(phi);

