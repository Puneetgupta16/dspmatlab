clc
clearvars
n = -1:0.01:1;
f = input('Frequency: ');
amp = input('Amplitude: ');
phase = input('Phase: ');
u = amp*sin(2*pi*f*n+phase);
subplot(2,1,1)
stem(n,u)
xlabel('n');
ylabel('x[n]');
title('Puneet Gupta-102115213 Sinusoidal in discrete')
subplot(2,1,2)
plot(n,u)
xlabel('n');
ylabel('x[n]');
title('Puneet Gupta-102115213 Sinusoidal in continues')