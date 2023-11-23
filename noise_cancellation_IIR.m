% Generate a noisy signal with white Gaussian noise
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:1; % Time vector (1 second)
signal = sin(2*pi*5*t) + 0.5*randn(size(t)); % Signal with added noise

% Design a Butterworth IIR filter
order = 4; % Filter order
cutoff_freq = 30; % Cutoff frequency for the filter (adjust as needed)
[b, a] = butter(order, cutoff_freq / (fs/2), 'high');

% Apply the IIR filter to remove noise
filtered_signal = filtfilt(b, a, signal);

% Plot the original signal, noisy signal, and filtered signal
figure;
subplot(3,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, signal);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, filtered_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
