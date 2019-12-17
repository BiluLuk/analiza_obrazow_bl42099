close all;
clear all;

fp=44100;

f1=20; % dla pierwszej sinusoidy
f2=80; % dla drugiej sinusoidy
f3=1000; % dla trzeciej sinusoidy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WSPOLCZYNNIKI ROWNANIA ROZNICOWEGO %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wsxn = 0.00003221828;
wsxn1 = 0.00006443656;
wsxn2 = 0.00003221828;
wsyn1 = 1.9838815166;
wsyn2 = 0.984010068;


%%%%%%%%% DLA PIERWSZEJ CZÊSTOTLIWOSCI
for n=0:60000
    a(n+1)=sin(2*pi*(f1/fp)*(n));
    y1(n+1)=a(n+1);
end
 
for n=3:60000
    y1(n)= wsxn*a(n) + wsxn1*a(n-1) + wsxn2*a(n-2) + wsyn1*y1(n-1) - wsyn2*y1(n-2);
end
plot(y1);

%%%%%%%%% DLA DRUGIEJ CZÊSTOTLIWOSCI
for n=0:30000
  b(n+1)=sin(2*pi*(f2/fp)*(n+1));
   y2(n+1)=b(n+1);
end
for n=3:30000
    y2(n)= wsxn*b(n) + wsxn1*b(n-1) + wsxn2*b(n-2)+wsyn1*y2(n-1)- wsyn2*y2(n-2);
end
figure
plot(y2);

%%%%%%%%% DLA TRZECIEJ CZÊSTOTLIWOSCI
for n=0:30000
  c(n+1)=sin(2*pi*(f3/fp)*(n+1));
   y3(n+1)=c(n+1);
end
for n=3:30000
    y3(n)= wsxn*c(n)+ wsxn1*c(n-1)+wsxn2*c(n-2)+wsyn1*y3(n-1)- wsyn2*y3(n-2);
end
 
figure
plot(y3);
