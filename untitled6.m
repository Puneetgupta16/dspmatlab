clc;
clear all;
close all;

% Design a Butterworth IIR filter
N = 4; % Filter order
Fc = 0.1; % Cutoff frequency
[b, a] = butter(N, Fc);

% Generate a sample input signal
Fs = 1000; % Sample rate
t = 0:1/Fs:1;
x = sin(2 * pi * 50 * t) + 0.5 * randn(size(t));

% Apply the IIR filter
y = filter(b, a, x);

% Plot the original and filtered signals
subplot(2,1,1);
plot(t, x);
title('Original Signal');

subplot(2,1,2);
plot(t, y);
title('Filtered Signal');
