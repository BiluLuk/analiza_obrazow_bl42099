clear all;
close all; 

audio_in = audioread('007.wav');

left_channel = audio_in(:,1);
right_channel = audio_in(:,2);
surr = (left_channel - right_channel) * 0.5;

x = surr;
y = x;

for n = 1 : 450
   y(n) = 0;
end

for n=450:numel(x)
   y(n) =  0.0101*x(n) - 2.0202*x(n-1) + 0.0101*x(n-2) - 2.0201*y(n-1) - 1.0203*y(n-2);
end

for n=450:numel(x)
   y(n) =  0.1273*x(n) + 0.2545*x(n-1) + 0.1273*x(n-2) + 0.7691*y(n-1) - 0.2781*y(n-2);
end
 
left_surr = y;
right_surr = -y;

central_channel = (left_channel + right_channel) * 0.5;
x = central_channel;
y = x;

for n=3:numel(x)
   y(n) =  0.00003221828*x(n) + 0.00006443656*x(n-1) + 0.00003221828*x(n-2) + 1.9838815166*y(n-1) - 0.984010068*y(n-2);
end
subuwoofer = y;
 
audiowrite('left_channel.wav', left_channel, 44100);
audiowrite('right_channel.wav', right_channel, 44100);
audiowrite('central_channel.wav', central_channel, 44100);
audiowrite('left_back.wav', left_surr, 44100);
audiowrite('right_back.wav', right_surr, 44100);
audiowrite('subuwoofer.wav', subuwoofer, 44100);
