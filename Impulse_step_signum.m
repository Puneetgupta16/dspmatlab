clc;
clear all;

x = -10:1:10;
t = 0;
y = (x-t == 0);
subplot(2,2,1);
stem(x,y)
title('Unit impulse function');
xlabel('t');
ylabel('f(t)');

subplot(2,2,2);
z = (x-t>=0);
stem(x,z)
title('Unit step function');
xlabel('t');
ylabel('f(t)');

subplot(2,2,3);
a = sign(x);
stem(x,a)
title('Unit signum function');
xlabel('t');
ylabel('f(t)');

sgtitle('Puneet Gupta 102115213')

