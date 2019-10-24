clear;

y1 = 0%initial height(meters)
r1 = [0,y1];
speed = 15;
theta = 45;

v1 = [speed*cos(theta*pi/180), speed*sin(theta*pi/180)];
r = r1; v = v1;

Cd = 0.35;
area = 4.3e-3;
grav = 9.81;
mass = 0.145;
airFlag = input('Air resistance? (yes: 1, No: 0): ');

if(airFlag == 0)
    rho = 0;
else
    rho = 1.2;
end

air_const = -0.5*Cd*rho*area/mass;

tau = input('Enter timestep, tau (sec): ');
maxstep = 1000;
for istep=1:maxstep
    xplot(istep) = r(1);
    yplot(istep) = r(2);
    t = (istep-1)*tau;
    xNoAir(istep) = r1(1)+v1(1)*t;
    yNoAir(istep) = r1(2)+v1(2)*t-0.5*grav*t^2;
    
    accel = air_const*norm(v)*v;
    accel(2) = accel(2)-grav;
    
    r = r+tau*v;
    v = v+tau*accel;
    
    if(r(2) <0)
        xplot(istep+1) = r(1);
        yplot(istep+1) = r(2);
        break;
    end
end
fprintf('Maximum Range is %g meters\n',r(1));
fprintf('Time of flight is %g seconds\n', istep*tau');

clf; figure(gcf);

xground = [0 max(xNoAir)]; yground = [0 0];

plot(xplot, yplot, '+', xNoAir, yNoAir, '-', xground, yground,'-');
legend('Euler method', 'Theory(No air)');
xlabel('Range (m)');
ylabel('Height(m)');
title('Projectile motion');

