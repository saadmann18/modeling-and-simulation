clear all; close all; clc; clf;

eps0=8.854e-12;       % vacuum permittivity
mu0=4.*pi*1e-7;       % vacuum permeability
c0=1./sqrt(eps0*mu0); % speed of emw 

lambda0=1000e-9;      % set wavelength of source to 1000nm
freq=c0/lambda0;      % frequency of emw corr. to 1000nm

dz=lambda0/40;       % set spatial grid spacing
dt=dz*sqrt(eps0*mu0); % % set temporal grid spacing
% Represents a time step, that can be calculated by 
%time=(Length of path in z-direction/velocity) due to 1D. t = s/v or s = vt

nz=3000;              % set number of spatial points
nt=1500;              % set number of iterations

mu_r(1:nz)=1;         % relative permeability in vaccuum
mu_r(nz/2:nz/2+round(2000e-9/dz))=1; % permeability of the dielectric slab

eps_r(1:nz)=1.;        % relative permittivity in vaccuum 
eps_r(nz/2:nz/2+round(2000e-9/dz))=1000; % permittivity of the dielectric slab

E(1:nz)=0;            % initial electric field
H(1:nz)=0;            % intitial magnetic field

i_source=nz*0.4 % initial position of emw 
source=@(t) sin(2.*pi*freq*t)*exp(-((t-4./freq)/(2./freq))^2) %Equation of the carrier wave.

for j=1:nt 
    %XX COMPLETE THE SOURCE CODE HERE XX
    for i = 2:nz    %update loop for H
        H(i)=H(i)+(dt/dz/mu0/mu_r(i))*(E(i)-E(i-1)); %update equation
    end
    for i = (1:nz-1)  %update loop for E
        E(i)=E(i)+(dt/dz/eps0/eps_r(i))*(H(i+1)-H(i));
    end        
    E(i_source)=E(i_source)-source(j*dt); % Calculates the value of initial position of the electric field in each iteration   
    plot(1:nz,E,1:nz,eps_r>1);            % Plotting the electric field and the slab in each iterations.
    ylim([-1.5 1.5]);                     % fix scaling of the plot
    drawnow; % this forces Matlab to immediately plot the graph, allows animation
end
%question 2.d)

time1=(2.0*10^-13);    % specified time
dist=c0*time1          % distance travelled in that time
