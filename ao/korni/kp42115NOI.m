clear all;
close all;

N = 1000;
a0 = 1;
a1 = 2;
a2 = 1;

b0 = 31038.28;
b1 = -61576.26;
b2 = 30541.98;

omg = 2 * pi * ( 80 / 44100 ); % omega graniczna
indx = 0;


for n = 1:(N-1)
    H(n) = (a0 + a1*exp(-1j*omg*n)^-1 + a2*exp(-1j*omg*n)^-2) / (b0 + b1*exp(-1j*omg*n)^-1 + b2*exp(-1j*omg*n)^-2);
    indx(n) = n;
end

plot(abs(indx), (H*44100)/(2*pi));
