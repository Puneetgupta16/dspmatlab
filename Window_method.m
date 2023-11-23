% Rectangular window method
clc;
clearvars;
% Window length
N = 64;

% Rectangular window
rect_window = ones(1, N);

% Frequency response using the FFT
freq_response = fft(rect_window, 1024);

% Frequency axis
f_axis = linspace(0, 1, 1024);

% Plot frequency response
figure;
plot(f_axis, 20 * log10(abs(fftshift(freq_response))));
title('Frequency Response of Rectangular Window');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('Magnitude (dB)');
grid on;
