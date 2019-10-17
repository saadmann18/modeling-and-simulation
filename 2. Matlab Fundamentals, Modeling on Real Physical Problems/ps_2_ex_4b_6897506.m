%Name of the student: Saad Bin Abdul Mannan
%Matriculation Number: 6897506
%Course: Electrical Systems Engineering
%Homework on Modeling and Simulation problem sheet 2

function [x,y,z] = ps_2_ex_4b_6897506(r,theta,phi)

x = r .* sin(phi);
y = r.*cos(phi).*cos(theta);
z = r*cos(phi).*sin(theta);

