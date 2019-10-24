h=0.000001;
L=5.0;          				%val. inductor
R=50;           				%val. internal resistance
Vco(1)=1; Vca = Vco;			%intial v of the capacitor
c=0.0001;       				%val. capacitor
Io(1)=0;         				%initial i through the circuit 
     				

for i=1:(1/h)
    Io(i+1)= Io(i)+(h*(Vco(i)-(R*Io(i))/L));
    Vco(i+1)=Vco(i)-(h*(Io(i)/c));

    Ia(i)=Io(i+1)-(h*(Vco(i+1)-(R*Io(i+1))/L));
    Vca(i)=Vco(i+1)+(h*(Io(i+1)/c));
end
Vca(i+1) = Vco(i+1);

t=0:h:1;
plot(t,Vco,'g*',t,Vca,'r-.')
xlabel('Time(s)')
ylabel('Cap. voltage')
title('Time vs Cap. voltage')
legend('Fwd euler method','Bwd euler method','Location','Southeast')