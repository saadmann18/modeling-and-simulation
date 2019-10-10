function x = my_diag(n);

p = ones(n,n);
a = 2*diag(diag(p))+1;

for i = 1:n
    for j = 1:n
        m(j) = (j*a(i,j));        
    end
    b(i)=sum(m);
end
x = a\b';
