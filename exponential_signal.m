clc
clearvars

%define sampling freguency
sf = 1000;
%definr frequency
f = 5;
%define time axis(x-axis)
t = 0:1/sf:1-1/sf;
%generating waveform
y = exp(2*t);
figure(1)
plot(t,y)
title('Exponential waveform')
xlabel('time ->')
ylabel('f(t) ->')