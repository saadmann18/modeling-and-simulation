clc;

y1 = 0; yn = 0;
n = 7;
L = 3;
E = 200;
I = 30000;
w = 15;

x = linspace(0,3,n)';
dx = x(2)-x(1);
x_int = x(2:end-1);

n_mat = n-2;
diag_vals = [1*ones(n_mat,1) -2*ones(n_mat,1) 1*ones(n_mat,1)];
A = spdiags(diag_vals, -1:1, n_mat, n_mat);
RHS = w*dx^2/(2*E*I)*(L*x_int-x_int.^2);
y_int = A\RHS;
y = [y1; y_int; yn];