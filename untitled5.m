% IIR Filter Parameters
filterOrder = 4;            % Filter order (adjust as needed)
cutoffFrequency = 0.2;      % Cutoff frequency (normalized to Nyquist frequency)

% Create a Butterworth low-pass filter
[b, a] = butter(filterOrder, cutoffFrequency, 'low');

% Generate a test input signal (e.g., a sine wave)
fs = 1000;                  % Sampling frequency (Hz)
t = 0:1/fs:1;               % Time vector from 0 to 1 second
inputSignal = sin(2*pi*5*t); % 5 Hz sine wave

% Apply the IIR filter to the input signal
outputSignal = filter(b, a, inputSignal);

% Plot the input and filtered signals
figure;
subplot(2,1,1);
plot(t, inputSignal);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, outputSignal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Display the frequency response of the filter
figure;
freqz(b, a);
title('Frequency Response of the IIR Filter');