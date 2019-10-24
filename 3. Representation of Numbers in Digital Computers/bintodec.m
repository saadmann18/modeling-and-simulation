function dec = bintodec(bin)

bin_nr = num2str(bin);
dec = 0;
for i = 1 : length(bin_nr)
    dec = dec + str2num(bin_nr(i)) * 2^(length(bin_nr) - i);
end
dec