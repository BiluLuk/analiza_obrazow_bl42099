clear all;
close all;

in = audioread('princess.wav');
x = in(:,1);
y = x;

wsxn = 0.00003221828;
wsxn1 = 0.00006443656;
wsxn2 = 0.00003221828;
wsyn1 = 1.9838815166;
wsyn2 = 0.984010068;




for n=3:numel(x)
    y(n)= wsxn*x(n) + wsxn1*x(n-1) + wsxn2*x(n-2)+wsyn1*y(n-1)- wsyn2*y(n-2);
end


audiowrite('kp42115.wav', y, 44100);