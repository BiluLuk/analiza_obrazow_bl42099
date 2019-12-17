clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FILTR ZE SKONCZONA ODPOWIEDZIA SOI %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 2000; % ilosc probek 
alfa = (N - 1) / 2;
wg = 2 * pi * ( 80 / 44100 ); % omega graniczna

% okno haninga
for n = 0:N-1
   w(n+1) = 0.5 - 0.5 * cos( (2*pi*n) / (N-1) );
   h(n+1) = ( sin(wg * (n - alfa) ) ) / ( pi * (n - alfa) );
   x(n+1) = n;
end

% suma koncowa 
sum = 0;
inx = 1;
for k = 0:0.01:pi
   for j = 0:N-1
      sum = sum + (w(j+1) * h(j+1) * exp(-1j * k * j));
   end
   
   hx(inx) = k;
   hy(inx) = sum;
   sum = 0;
   inx = inx + 1;
end

stem(x,w) % z oknem
figure;
stem(x,h); % bez okna 
figure;
plot((hx*44100)/(2*pi),abs(hy)); % wykres zale¿nosci amplitudowej |H| <- jako os Y omega <- OX







