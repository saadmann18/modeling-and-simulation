function dydt = freefall(t,y,cd,m)
grav = 9.81;
dydt = [y(2);grav-cd/m*y(2)*abs(y(2))];