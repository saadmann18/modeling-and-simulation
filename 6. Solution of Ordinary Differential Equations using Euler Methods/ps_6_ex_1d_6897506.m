clear all;
close all
clc
%1 (d)(1)
h = 2*10^-6;
L = 50*10^-3;           				
R = 200; 
C = 0.2*10^-6;
I(1) = 30*10^-3; 
Vf(1) = 12;
Vb = Vf;
If(1) = 30*10^-3;       				

for i=1:500
    Vf(i+1) = Vf(i)-h*((Vf(i)+R*I(1))/(R*C));
    Vb(i+1) = Vf(i+1)-h*((Vb(i)+R*I(1))/(R*C));
    
    If(i+1) = If(i)+(h*(Vf(i)/L));
    Ib(i+1)=If(i)+(h*(Vb(i+1)/L)); 
end
%%1 (d)(2)
h2= 2*10^-6;
L2= 8*10^-3;          				
R2= 20*10^3;
C2 =0.125*10^-6;
I2(1) = -12.25*10^-3; 
Vf2(1) = 0;
Vb2 = Vf2;
 If2= -12.25*10^-3;      				

for i=1:5000
    Vf2(i+1)= Vf2(i)-h2*((Vf2(i)+R2*I2(1))/(R2*C2));
    Vb2(i+1)=Vf2(i+1)-h2*((Vb2(i)+R2*I2(1))/(R2*C2));
    
    If2(i+1)=If2(i)+(h2*(Vf2(i)/L));
    Ib2(i+1)=If2(i)+(h2*(Vb2(i+1)/L));
end
%%
h3= 2*10^-6;
L3=0.4;          				
R3=100; 
C3 =10*10^-6;
I3(1) = 250*10^-3; 
Vf3(1) = 50;
Vb3 = Vf3;
If3=250*10^-3;         				

for i=1:5000
    Vf3(i+1)= Vf3(i)-h3*((Vf3(i)+R3*I3(1))/(R3*C3));
    Vb3(i+1)=Vf3(i+1)-h3*((Vb3(i)+R3*I3(1))/(R3*C3));
    
    If3(i+1)=If3(i)+(h3*(Vf3(i)/L));
    Ib3(i+1)=If3(i)+(h3*(Vb3(i+1)/L));
end

%%
t=0:h:0.001;
subplot(2,3,1);
plot(t,Vf,'g*',t,Vb,'r-.')
xlabel('Time(s)')
ylabel('voltage')
title('Time vs voltage')
legend('Fwd euler method','Bwd euler method','Location','Southeast')

t2=0:h2:0.01;
subplot(2,3,2);
plot(t2,Vf2,'g*',t2,Vb2,'r-.')
xlabel('Time(s)')
ylabel('voltage')
title('Time vs voltage')
legend('Fwd euler method','Bwd euler method','Location','Southeast')

t3=0:h3:0.01;
subplot(2,3,3);
plot(t3,Vf3,'g*',t3,Vb3,'r-.')
xlabel('Time(s)')
ylabel('voltage')
title('Time vs voltage')
legend('Fwd euler method','Bwd euler method','Location','Southeast')


subplot(2,3,4)
plot(t,If,'g*',t,Ib,'r-.')
xlabel('Time(s)')
ylabel('Current')
title('Time vs Current')
legend('Fwd euler method','Bwd euler method','Location','Southeast')

subplot(2,3,5)
plot(t2,If2,'g*',t2,Ib2,'r-.')
xlabel('Time(s)')
ylabel('Current')
title('Time vs Current')
legend('Fwd euler method','Bwd euler method','Location','Southeast')

subplot(2,3,6)
plot(t3,If3,'g*',t3,Ib3,'r-.')
xlabel('Time(s)')
ylabel('Current')
title('Time vs Current')
legend('Fwd euler method','Bwd euler method','Location','Southeast')
