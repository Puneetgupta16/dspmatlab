clc; 
clear all
% Get user input for the sequence
N = input('Enter the length of the sequence: '); 
x = input('Enter the sequence values (space-separated): '); 
if length(x) ~= N 
 error('Number of sequence values must match the specified length.'); 
end
% Get user input for the number of points of DFT
M = input('Enter the number of points for DFT: '); 
% Perform DFT
X = dft(x, M); 
% Perform IDFT
x_reconstructed = idft(X, N); 
% Display results
disp('Original Sequence:'); 
disp(x); 
disp('DFT Result:'); 
disp(X); 
disp('IDFT Result:'); 
disp(x_reconstructed); 
% Plotting the magnitude and phase of DFT result
figure; 
subplot(2, 2, 1); 
stem(abs(X)); 
title('Magnitude of DFT'); 
xlabel('Frequency Bin'); 
ylabel('Magnitude'); 
subplot(2, 2, 2); 
stem(angle(X)); 
title('Phase of DFT'); 
xlabel('Frequency Bin'); 
ylabel('Phase (radians)'); 
% Plotting the magnitude and phase of IDFT result
subplot(2, 2, 3); 
stem(abs(x_reconstructed)); 
title('Magnitude of IDFT'); 
xlabel('Time Index'); 
ylabel('Magnitude'); 
subplot(2, 2, 4); 
stem(angle(x_reconstructed)); 
title('Phase of IDFT'); 
xlabel('Time Index'); 
ylabel('Phase (radians)'); 
sgtitle('Puneet Gupta 102115213') 
% DFT function
function X = dft(x, M) 
 N = length(x); 
 X = zeros(1, M); 
 
 for k = 0:M-1 
 for n = 0:N-1 
 X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / M); 
 end
 end
end
% IDFT function
function x = idft(X, N) 
 M = length(X); 
 x = zeros(1, N); 
 
 for n = 0:N-1 
 for k = 0:M-1 
 x(n+1) = x(n+1) + X(k+1) * exp(1j * 2 * pi * k * n / M); 
 end
 x(n+1) = x(n+1) / M; 
 end
end