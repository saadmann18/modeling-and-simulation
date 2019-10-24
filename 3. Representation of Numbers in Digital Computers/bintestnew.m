function dec = bintestnew(bin,sign1)

if sign1 == 0
binstring = [];
    if length(bin) > 1
     for i = 1:length(bin)
          tempstring = num2str(bin(i));
          binstring = [binstring,tempstring];
     end
    else
     binstring=num2str(bin);
    end
        
    l = length(binstring); %l=8
    binstring = str2num(binstring);
    
    b=-1;
    v=[];
    while b~=0
       a=rem(binstring,10); 
       b=fix(binstring/10);   
       v=[a,v];  
       binstring=b;
    end

    if length(v)~=8
        v=[zeros(1,abs(8-length(v))),v];
    end
    
    for i = 1:8;
     value(i)=(v(i)) ...
     *(2^(length(v)-i));
end
dec=sum(value);
else

    binstring = [];
    if length(bin) > 1
     for i = 1:length(bin)
          tempstring = num2str(bin(i));
          binstring = [binstring,tempstring];
     end
    else
     binstring=num2str(bin);
    end
        binstring = [];
    if length(bin) > 1
     for i = 1:length(bin)
          tempstring = num2str(bin(i));
          binstring = [binstring,tempstring];
     end
    else
     binstring=num2str(bin);
    end
    l = length(binstring);
    binstring = str2num(binstring);
    
    b=-1;
    v=[];
    while b~=0
       a=rem(binstring,10); 
       b=fix(binstring/10);   
       v=[a,v];  
       binstring=b;
    end
    if length(v)~=8,
        v=[zeros(1,abs(8-length(v))),v];
    end
    %%2s compliment
    v = logical(v);
    
    saada = [~v];
    saadb = [0 0 0 0 0 0 0 1];
    saadc = saada&saadb;
    while any(saadc)
    saadb = xor(saada, saadb);
    saada = circshift(saadc, -1);
    saadc = saada&saadb;
    end
  saad=saada+saadb;
    
    for i = 1:length(saad);
     value(i)=(saad(i)) ...
     *(2^(length(saad)-i));
end
dec=-sum(value);
    
end
