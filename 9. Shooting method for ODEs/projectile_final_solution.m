clear all;
close all;
clc

m = 3;
g = 9.8;
k = 0.0216;
ti = 0;
tf = 5;

zi = 0;
zf_target=80;

v(1) = 10;  %first guess for initial velocity
v(2) = 20;  %second guess for initial velocity

f=@(t,y) [y(2); -g+(-1)^(y(2)>0)*(k/m)*y(2)^2]; 
rb=@(z) (z-zf_target);  %difference between current and final value

for j = 1:50
    [t,y] = ode45(f,[ti tf], [zi; v(j)]);
    zb(j) = y(end,1);
    
    subplot(211); plot(t,y(:,1), 'LineWidth', 2); hold on; %position
    subplot(212); plot(t,y(:,2), 'LineWidth', 2); hold on;  %velocity
    %pause(2); %pause for 2sec to animate
    
    if abs(rb(zb(j)))<0.001 %call the func rb, check difference
        break;
    end
    if(j>1)
        v(j+1)=v(j)-rb(zb(j))*(v(j)-v(j-1))/(rb(zb(j))-rb(zb(j-1)));
    end
end

subplot(211); grid on;
title('vertical position as a function of time');
xlabel('time in sec', 'color', 'b');
ylabel('Vertical position along z axis in m','Color','b');
for i=1:j str(i)="Guess-"+num2str(i);end 
legend(str,'Location','Southwest');

subplot(212);
grid on
title('Velocity as function of time');
xlabel('time in sec', 'color', 'b');
ylabel('Velocity in m/s','Color','b');
legend(str,'Location','Southwest');

hold off;