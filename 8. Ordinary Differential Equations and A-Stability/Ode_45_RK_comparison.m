h = 0.05;      %Step Size

L = 2.4;         %Ind 
C = 0.08;    %Cap
R = 1.5;        %Res
Uo = 100;       %Peak Voltage
w = 0.3/sqrt(L*C);

tspan = [0 0.2];
i0 =[0 1];   
[t,i] = ode45(@(t,i) diffeqns(t,i,R,L,C,Uo,w) , tspan, i0);

V1(1) = 0;      %Initial Voltage will be 0
I1(1) = 1;      %Initial Current will be 1
x = 1:200;
k1 = 0;
k2 = 0;
l1 = 0;
l2 = 0;
for t = 1:length(x)
    k1 = I1(t)/C;
    l1 = (Uo*cos(w*t)-V1(t)-I1(t)*R)/L;
    k2 = I1(t)/C + (((1/2)*h* ((Uo*cos(w*t)-V1(t)-I1(t)*R)/L))/C);
    l2 = (Uo*cos(w*(t+h/2)))/L-(V1(t)+(1/2)*(1/C)*h*I1(t))/L - ((((Uo*cos(w*t)-V1(t)-I1(t)*R)/L)*(h/2)+I1(t))*R)/L;
    V1(t+1) = V1(t) + (h)* k2 ;             
    I1(t+1) = I1(t) + (h)* l2; 
end
t = 0:length(x);

k = 1:length(i);
plot(k,i(:,2),t,I1); 
xlabel('Time')
ylabel('Current')
title('ODE45 and RK method comparison')
legend('ODE45', 'RK method','Location','northeast')

% figure
% plot(k,i(:,1),t,V1)  % Volt

