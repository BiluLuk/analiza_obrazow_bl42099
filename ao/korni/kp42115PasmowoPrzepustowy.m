clear all;
close all;
Hpp = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dolnoprzepustowy z 7000 HZ Fg %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fp = 44100;
fg = 7000;
k = fp/(pi*fg)

a0 = 1;
a1 = 2;
a2 = 1;

b0 = k^2 + sqrt(2)*k + 1
b1 = -2*k^2 + 2
b2 = k^2 - sqrt(2) * k + 1

indx = 1;

for n=0:0.00001:pi
    z = exp(-1j*n);
    H(indx) = (a0+a1*z^-1+a2*z^-2)/(b0+b1*z^-1+b2*z^-2);
    x(indx) = n;
    indx = indx + 1;
end
Hpp = H;
plot((x*fp)/(2*pi), abs(H))
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gornoprzepustowy z 100 HZ Fg %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%clear all;

indx = 1;
a0 = 1;
a1 = -2;
a2 = 1;

b0 = 1.01013;
b1 = -1.9999;
b2 = 0.98998;

for n=0:0.00001:pi
    z = exp(-1j*n);
    H(indx) = (a0+a1*z^-1+a2*z^-2)/(b0+b1*z^-1+b2*z^-2);
    x(indx) = n;
    indx = indx + 1;
end

plot((x*44100)/(2*pi), abs(H))
figure

Hpp = Hpp .* H;


plot((x*44100)/(2*pi), abs(Hpp))
