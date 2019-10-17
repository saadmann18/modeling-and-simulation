clear all;
close all;
clc

syms k x
f1 = symsum(k,k,1,6)

f2 = symsum(k^2,k,1,6)

f3 = symsum(k^3,k,1,6)