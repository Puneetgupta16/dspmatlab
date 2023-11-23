clc
clear all
% defining sampling frequency
sf=1000; 

% define time axis
n = -0.05:1/sf:0.05;   

% define frequency by taking user input
f = input('frequency: ');

% define duty cycle by taking user input
d = input('Dutycycle: '); 

% using matlab inbuilt square function for generating sqaure wave
u = square(2*pi*f*n,d);

% plotting results
subplot(2,2,1)
stem(n,u)
xlabel('n');
ylabel('x[n]');
title('Sushant Kumar-102115212 Square Wave In Discrete')
subplot(2,2,2)
plot(n,u)
xlabel('n');
ylabel('x[n]');
title('Sushant Kumar-102115212 Square Wave In Continues')