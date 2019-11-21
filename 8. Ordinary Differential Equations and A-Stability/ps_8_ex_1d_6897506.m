clear all
close all
clc

vc0=0;
il0=0;
c=0.08;
l=2.4;
r1=1.5;
r2=2.7386;
r3=10;
vi=8;

t_start=0;
t_end=10;
h=5E-2;
t=t_start:h:t_end;
N=length(t);

vc1=vc0;
il1=il0;
vc2=vc0;
il2=il0;
vc3=vc0;
il3=il0;

for i=1:N-1
    
    vk1_1 = ((il1(i)/c)-(vc1(i)/(r1*c)));			% Approximate for x gives approx for derivative
    ik1_1 = (vi-vc1(i))/l;		% Approximate for y gives approx for derivative
    vk2_1 = ((il1(i)/c)-(vc1(i)/(r1*c)))+h*((1/c)*((vi-vc1(i))/l)-(1/(r1*c))*((il1(i)/c)-(vc1(i)/r1*c))); 		% Approximate derivative at intermediate value
    ik2_1 = ((vi-vc1(i))/l)+h*((-1/l)*((il1(i)/c)-(vc1(i)/(r1*c))));	% Approximate derivative at intermediate value
    vc1(i+1) = vc1(i) + (h/2) *(vk1_1+vk2_1);		% Approximate solution at next value of x
    il1(i+1) = il1(i) + (h/2) * (ik1_1+ik2_1);
   
    vk1_2 = ((il2(i)/c)-(vc2(i)/(r2*c)));			% Approximate for x gives approx for derivative
    ik1_2 = (vi-vc2(i))/l;		% Approximate for y gives approx for derivative
    vk2_2 = ((il2(i)/c)-(vc2(i)/(r2*c)))+h*((1/c)*((vi-vc2(i))/l)-(1/(r2*c))*((il2(i)/c)-(vc2(i)/r2*c))); 		% Approximate derivative at intermediate value
    ik2_2 = ((vi-vc2(i))/l)+h*((-1/l)*((il2(i)/c)-(vc2(i)/(r2*c))));	% Approximate derivative at intermediate value
    vc2(i+1) = vc2(i) + (h/2) *(vk1_2+vk2_2);		% Approximate solution at next value of x
    il2(i+1) = il2(i) + (h/2) *(ik1_2+ik2_2);
   
    vk1_3 = ((il3(i)/c)-(vc3(i)/(r3*c)));			% Approximate for x gives approx for derivative
    ik1_3 = (vi-vc3(i))/l;		% Approximate for y gives approx for derivative
    vk2_3 = ((il3(i)/c)-(vc3(i)/(r3*c)))+h*((1/c)*((vi-vc3(i))/l)-(1/(r3*c))*((il3(i)/c)-(vc3(i)/r3*c))); 		% Approximate derivative at intermediate value
    ik2_3 = ((vi-vc3(i))/l)+h*((-1/l)*((il3(i)/c)-(vc3(i)/(r3*c))));	% Approximate derivative at intermediate value
    vc3(i+1) = vc3(i) + (h/2) *(vk1_3+vk2_3);		% Approximate solution at next value of x
    il3(i+1) = il3(i) + (h/2) * (ik1_3+ik2_3);    
   
end

f = @(t,xp) [-(-vi-xp(2))/l;-(xp(1)/c)-(xp(2)/(r1*c))];
[t,xa] = ode45(f,0:h:10,[0 0]);

figure;
subplot(2,3,1)
plot(t,xa(:,1),'b-.' ,t,il1,'r-.')
xlabel('time'), ylabel('Inductor Current')
legend('ode45 Il', 'heun''s Il ')
title('RLC circuit with R=1.5 ohm')

subplot(2,3,4)
plot(t,xa(:,2),'b-.' ,t,-vc1,'r-.')
xlabel('time'), ylabel('Output Voltage')
legend('ode45 V0', 'heun''s V0 ')
title('RLC circuit with R=1.5 ohm')

f = @(t,xp) [-(-vi-xp(2))/l;-(xp(1)/c)-(xp(2)/(r2*c))];
[t,xa] = ode45(f,0:h:10,[0 0]);

subplot(2,3,2)
plot(t,xa(:,1),'b-.' ,t,il2,'r-.')
xlabel('time'), ylabel('Inductor Current')
legend('ode45 Il', 'heun''s Il ')
title('RLC circuit with R=2.7386 ohm')

subplot(2,3,5)
plot(t,xa(:,2),'b-.' ,t,-vc2,'r-.')
xlabel('time'), ylabel('Output Voltage')
legend('ode45 V0', 'heun''s V0 ')
title('RLC circuit with R=1.7386 ohm')

f = @(t,xp) [-(-vi-xp(2))/l;-(xp(1)/c)-(xp(2)/(r3*c))];
[t,xa] = ode45(f,0:h:10,[0 0]);

subplot(2,3,3)
plot(t,xa(:,1),'b-.' ,t,il3,'r-.')
xlabel('time'), ylabel('Inductor Current')
legend('ode45 Il', 'heun''s Il ')
title('RLC circuit with R=10 ohm')

subplot(2,3,6)
plot(t,xa(:,2),'b-.' ,t,-vc3,'r-.')
xlabel('time'), ylabel('Output Voltage')
legend('ode45 V0', 'heun''s V0 ')
title('RLC circuit with R=10  ohm')