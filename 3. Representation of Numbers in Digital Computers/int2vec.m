function v = int2vec(binstring,l)

b=-1;
v=[];


while b~=0,
   a=rem(binstring,10); 
   b=fix(binstring/10);   
   v=[a,v];  
   binstring=b  
end

if length(v)~=l
    v=[zeros(1,abs(l-length(v))),v];
end
