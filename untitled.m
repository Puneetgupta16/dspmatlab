% Simulation Parameters
numAntennas = 8;            % Number of antenna elements in the array
signalFreq = 1e6;           % Signal frequency in Hz (1 MHz)
samplingFreq = 10e6;        % Sampling frequency in Hz (10 MHz)
signalAngle = 30;           % Desired angle of arrival in degrees
SNR_dB = 20;                % Signal-to-noise ratio in dB

% Generate Narrowband Signal
t = 0:1/samplingFreq:1-1/samplingFreq;
signal = cos(2*pi*signalFreq*t);

% Generate Noise
noisePower = 10^(-SNR_dB/10); % Convert SNR to linear scale
noise = sqrt(noisePower) * randn(size(t));

% Create Array Response Vector (Phase Shift)
lambda = physconst('LightSpeed') / signalFreq; % Wavelength
elementSpacing = lambda / 2; % Half-wavelength spacing for ULA
desiredPhaseShift = exp(-1i * 2 * pi * elementSpacing * sind(signalAngle) * (0:numAntennas-1) / lambda);

% Apply Phase Shift (Element-wise Multiplication)
beamformedSignal = signal .* desiredPhaseShift;

% Sum the signals from individual antennas
beamformedOutput = sum(beamformedSignal);

% Plot Original Signal and Beamformed Signal
figure;
subplot(2, 1, 1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, real(beamformedOutput));
title('Beamformed Signal');
xlabel('Time (s)');
ylabel('Amplitude');
