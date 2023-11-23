clc
clearvars

%define sampling freguency
sf = 1000;
%definr frequency
f = 5;
%define time axis(x-axis)
t = 0:1/sf:1-1/sf;
%generating waveform
y = sawtooth(2*pi*f*t,0.5); %sawtooth function have one more parameter for inclination
figure(1)
plot(t,y)
title('Triangular waveform')
xlabel('time ->')
ylabel('f(t) ->')