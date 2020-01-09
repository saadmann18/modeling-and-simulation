% Modeling and simulation: Problem Sheet 11, ex.1
% Forward Time Centered Space method for 2D heat equation:
% d/dt * u(x,y,t)=k*(d^2/dx^2 * u(x,y,t)+d^2/dy^2 * u(x,y,t))
% u(x,y,t) - temperature distribution as a function of space and time

clear all; clf; clc;       % clear variables & figures

% initialize values
k=0.2;                 % thermal conductivity (heat conductance) in [m^2/s]

Lx=2;                  % length of the domain in x direction in [m]
Ly=1;                  % length of the domain in y direction in [m]
nx=51;                 % number of spatial points along x direction
ny=26;                 % number of spatial points along y direction
dx=Lx/(nx-1);          % spatial resolution along x direction in [m]
dy=Ly/(ny-1);          % spatial resolution along y direction in [m]

x=-Lx/2:dx:Lx/2;       % initialize spatial points along x, center at x=0
%y=XX;                 % initialize spatial points along y, center at y=0
y=-Ly/2:dy:Ly/2; 

nt=301;                % number of time steps
%dt=XX;                 % set time step to stable maximum in [sec]
dt=dx^2*dy^2/(2*k*(dx^2+dy^2));
x0=0;                  % shift of gaussian along x
y0=0;                  % shift of gaussian along y
s=0.2236;              % width of the initial gaussian (sigma-variance)

cx=k*dt/dx^2;          % internal constant along x
cy=k*dt/dy^2;          % internal constant along y

u=zeros(nx,ny,nt);     % create a container for temperature u(x,y,t)

% set initial & boundary conditions

%*********************************************************************************
% case (i): gaussian initial shape centered at (x0=0,y0=0) and Dirichlet b.c.
%*********************************************************************************
for i=1:nx                            % gaussian initial condition
    for j=1:ny
        u(i,j,1)=exp(-(x(i)-x0)^2/s^2-(y(j)-y0)^2/s^2);
    end
end

u(1,:,:)=0;                           % Dirichlet b.c. at the left boundary
u(nx,:,:)=0;                          % Dirichlet b.c. at the right boundary
u(:,1,:)=0;                           % Dirichlet b.c. at the bottom boundary
u(:,ny,:)=0;                          % Dirichlet b.c. at the top boundary
%*********************************************************************************

% %*********************************************************************************
% % case (ii): gaussian initial shape centered at (x0=0.5,y0=0.3) and Dirichlet b.c.
% %*********************************************************************************

%XX COMPLETE THE SOURCE CODE HERE XX
% x0=0.5;                                 % shift of gaussian along x
% y0=0.3;                                 % shift of gaussian along y
% for i=1:nx                              % gaussian initial condition
%     for j=1:ny
%         u(i,j,1)=exp(-(x(i)-x0)^2/s^2-(y(j)-y0)^2/s^2);
%     end
% end
% 
% u(1,:,:)=0;                                 % Dirichlet b.c. at the left boundary
% u(nx,:,:)=0;                                % Dirichlet b.c. at the right boundary
% u(:,1,:)=0;                                 % Dirichlet b.c. at the bottom boundary
% u(:,ny,:)=0;                                % Dirichlet b.c. at the top boundary

% %*********************************************************************************

% %*********************************************************************************
% % case (iii): zero initial distribution and Dirichlet b.c.
% %*********************************************************************************

% XX COMPLETE THE SOURCE CODE HERE XX
% u(:,:,1)  = 0.0;                          %1 layer of time matrix
% u(1,:,:)  = 0;                            %T3 boundary (all layer of time matrix)
% u(nx,:,:) = 1;                            %T4 boundary (all layer of time matrix)
% u(:,1,:)  = repmat(0.5*x+0.5,1,1,nt);     %T1 boundary (all layer of time matrix)
% u(:,ny,:) = repmat(0.5*x+0.5,1,1,nt);     %T2 boundary (all layer of time matrix)

% %*********************************************************************************

% %*********************************************************************************
% % case (iv): gaussian initial shape centered at (x0=0,y0=0) and Dirichlet b.c.
% %*********************************************************************************

%XX COMPLETE THE SOURCE CODE HERE XX
% for i=1:nx                            % gaussian initial condition
%     for j=1:ny
%         u(i,j,1)=exp(-(x(i)-x0)^2/s^2-(y(j)-y0)^2/s^2);
%     end
% end
% u(1,:,:) = 0;   %T3
% u(nx,:,:) = 1;  %T4
% u(:,1,:)=repmat(0.5*x+0.5,1,1,nt);      %T1 % Dirichlet b.c. at the bottom boundary
% 
% %XX COMPLETE THE SOURCE CODE HERE XX  % Dirichlet b.c. at the top boundary
% u(:,ny,:) = repmat(0.5*x+0.5,1,1,nt);   %T2
% %*********************************************************************************

% %*********************************************************************************
% % case (v): gaussian initial shape centered at (x0=0.5,y0=0.3) and periodic b.c.
% %*********************************************************************************

% XX COMPLETE THE SOURCE CODE HERE XX 1
% x0=0.5;                  % shift of gaussian along x
% y0=0.3;                  % shift of gaussian along y
% for i=1:nx                            % gaussian initial condition
%     for j=1:ny
%         u(i,j,1)=exp(-(x(i)-x0)^2/s^2-(y(j)-y0)^2/s^2);
%     end
% end

% %*********************************************************************************

for k=1:nt-1                         % time iteration
    % cases (i), (ii), (iii), (iv), (v)
    %XX COMPLETE THE SOURCE CODE HERE XX
    for i = 2:nx-1
        for j = 2:ny-1
            u(i,j,k+1) = u(i,j,k)+cx*(u(i+1,j,k)-2*u(i,j,k)+u(i-1,j,k))...
                +cy*(u(i,j+1,k)-2*u(i,j,k)+u(i,j-1,k));
        end
    end
    % case (v) only, i.e., for periodic boundary conditions
    %XX COMPLETE THE SOURCE CODE HERE XX
        %second variant with ghost cells
    u(1,:,k+1)  = u(nx-1,:,k+1);    %left
    u(nx,:,k+1) = u(2,:,k+1);       %right
    u(:,1,k+1)  = u(:,ny-1,k+1);    %bottom
    u(:,ny,k+1) = u(:,2,k+1);       %top

end

%*********************************************************************************
% 1(e) This is the static solution for Dirichlet boundary conditions:
%*********************************************************************************
N=nx*ny;
a=zeros(N,N);
b=zeros(N,1);
n=0;
for j = 1:ny             
    for i = 1:nx
        %XX COMPLETE THE SOURCE CODE HERE XX 
       n = i+(j-1)*nx;
       if (i==1 || i==nx || j==1 || j==ny) % initial conditions
           a(n,n) = 1;
           b(n,1) = u(i,j,1);
       else
           a(n,n) = -2/dx^2 - 2/dy^2;   %-2*u(i,j)/dx^2 - 2*u(i,j)/dy^2
           a(n,n-1)  = 1/dx^2;          %1*u(i-1,j)/dx^2
           a(n,n+1)  = 1/dx^2;          %1*u(i+1,j)/dx^2
           a(n,n-nx) = 1/dy^2;          %1*u(i,j-1)/dy^2
           a(n,n+nx) = 1/dy^2;          %1*u(i,j+1)/dy^2

           b(n,1) = 0;
      end
    end
end
us=a\b;                 % static distribution of the temperature as a vector
us=reshape(us,[nx,ny]); % reshape the vector solution in 2D array
%*********************************************************************************

% plot static distribution of the temperature
[X,Y]=meshgrid(x,y); X=X'; Y=Y';
umin=min(min(us(:,:)));
umax=max(max(us(:,:)));
subplot(1,3,3); surf(X,Y,us(:,:),us(:,:),'FaceColor','interp','EdgeColor','n'); 
colormap jet; colorbar; caxis([umin 1]);
xlabel('x [m]'); ylabel('y [m]'); zlabel('Temperature [deg]');
title('Static distribution of the temperature at t->\infty');
axis image; zlim([umin 1]); drawnow;

% plot a time dependend solution as an animation
[X,Y]=meshgrid(x,y); X=X'; Y=Y';
umin=min(min(min(u(:,:,:))));
umax=max(max(max(u(:,:,:))));
for k=1:nt
    if (k==1) subplot(1,3,1); else subplot(1,3,2); end
    surf(X,Y,u(:,:,k),u(:,:,k),'FaceColor','interp','EdgeColor','n'); 
    colormap jet; colorbar; caxis([umin umax]);
    xlabel('x [m]'); ylabel('y [m]'); zlabel('Temperature [deg]');
    title(sprintf('Temperature at time t=%g s (k=%d)',(k-1)*dt,k));
    axis image; zlim([umin umax]); drawnow;
end