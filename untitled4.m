% Define parameters
Fs = 1000;             % Sampling frequency (Hz)
T = 1;                 % Total time duration (seconds)
N = Fs * T;            % Total number of samples
pulse_width = 0.1;     % Width of the rectangular pulse (seconds)
pulse_period = 1;      % Period of the pulse train (seconds)
num_pulses = T / pulse_period; % Number of pulses in the train

% Create a time vector
t = linspace(0, T, N);

% Generate the rectangular pulse train in the time domain
rect_pulse_train = zeros(1, N);
for i = 1:num_pulses
    pulse_start = (i - 1) * pulse_period * Fs + 1;
    pulse_end = pulse_start + pulse_width * Fs - 1;
    rect_pulse_train(pulse_start:pulse_end) = 1;
end

% Compute the Discrete Fourier Transform (DFT) of the pulse train
pulse_train_fft = fft(rect_pulse_train);

% Calculate the frequency axis for the frequency domain representation
f = (0:N-1) * Fs / N;

% Plot the magnitude spectrum
figure;
stem(f, abs(pulse_train_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Domain Representation of Rectangular Pulse Train');
axis([0 Fs -1 1.5]);

% Display only positive frequencies (optional)
xlim([0 Fs/2]);

% If you want to plot the phase spectrum as well, uncomment the following lines:
% figure;
% stem(f, angle
