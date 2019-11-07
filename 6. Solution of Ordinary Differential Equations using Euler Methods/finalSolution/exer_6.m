clear all
close all
clc

v0 = [0,12,50];
i0 = [ 0.25,-0.01225,0.03];
C = [10E-6,0.125E-6,0.2E-6];
L = [0.4,8,0.050];
R = [100,20000,200];
t_start = 0;
t_end = 0.01;
v1(1,:) = v0;
i1(1,:) = i0;
v2(1,:) = v0;
i2(1,:) = i0;
va(1,:) = v0;
ia(1,:) = i0;

t_end=0.01;
h=2E-5;
t=t_start:h:t_end;
N=length(t);

i1=zeros(N,3);
v1=zeros(N,3);
i2=zeros(N,3);
v2=zeros(N,3);
i3=zeros(N,3);
v3=zeros(N,3);

for i=1:N-1
    %explicit euler method
    v1(i+1,:)=v1(i,:)+h*(-1./(R.*C).*v1(i,:)-1./C.*i1(i,:));
    i1(i+1,:)=i1(i,:)+h*1./L.*v1(i,:);
    
    %implicit euler method
    v2(i+1,:)=R.*C.*L./(R.*C.*L+L*h+R*h^2).*v2(i,:)-h*R.*L./(R.*C.*L+L*h+R*h^2).*i2(i,:);
    i2(i+1,:)=(R.*C.*L+L*h)/(R.*C.*L+L*h+R*h^2).*i2(i,:)+h*R.*C./(R.*C.*L+L*h+R*h^2).*v2(i,:);
end
alfa=1./(2*R.*C);   
w0=1./sqrt(L.*C);
for i=1:3
    if(abs(alfa(i)-w0(i))<1E-6) %alfa=wo->criticaldamped resp case: II
        A1=v0(i);
        A2=-i0(i)/C(i)-v0(i)/(R(i)*C(i))+alfa(i)*v0(i);
        va(:,i)=A1*exp(-alfa(i)*t)+A2*exp(-alfa(i)*t).*t;
        ia(:,i)=i0(i)+1/L(i)*(-A1/alfa(i)*exp(-alfa(i).*t)-A2/alfa(i)*(t+1/alfa(i)).*exp(-alfa(i).*t)...
            +A1/alfa(i)+A2/alfa(i)^2);
    elseif (alfa(i)>w0(i)) %alfa>wo->overdamped resp case: I
            s1=-alfa(i)-sqrt(alfa(i).^2-w0(i).^2);
            s2=-alfa(i)+sqrt(alfa(i).^2-w0(i).^2);
            A1=(-i0(i)/C(i)-v0(i)/(R(i)*C(i))-s2*v0(i))/(s1-s2);
            A2=v0(i)-A1;
            va(:,i)=A1*exp(s1*t)+A2*exp(s2*t);
            ia(:,i)=i0(i)+1/L(i)*(A1/s1*exp(s1*t')+A2/s2*exp(s2*t')-(A1/s1+A2/s2));
    else
        wd=sqrt(w0(i).^2-alfa(i).^2);
        A1=v0(i);
        A2=(-i0(i)/C(i)-v0(i)/(R(i)*C(i))+alfa(i)*v0(i))/wd;
        va(:,i)=exp(-alfa(i)*t').*(A1*cos(wd*t')).*(A2*sin(wd*t'));
        ia(:,i)=i0(i)+1/L(i)*(A1/(wd^2+alfa(i)^2).*exp(-alfa(i).*t').*(wd*sin(wd*t'))-alfa(i)*cos(wd*t'))-...
            A2/(wd^2+alfa(i)^2).*exp(-alfa(i).*t').*(wd*cos(wd*t'))-alfa(i)*sin(wd*t')+...
            A1/alfa(i)/(wd^2+alfa(i)^2)+A2*wd/(wd^2+alfa(i)^2);
    end
end
figure;
subplot(2,3,1);plot(t,v1(:,1),'r-',t,v2(:,1),'b*',t,va(:,1),'g+','MarkerIndecis',1:1:N,'Linewidth',1);
xlabel('Time [s]');
ylabel('voltage [V]');
legend('forward (explicit) euler method', 'backward (implicit) euler method', 'analytical solutoin')
title('rlc parallel: overdamped system')
axis([0 1E-3 0 0.037]);