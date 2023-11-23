% Input signals
x = [1, 2, 3, 4];
h = [0.1, 0.2, 0.3];

% Lengths of input signals
Nx = length(x);
Nh = length(h);

% Length of circularly extended signals
N = Nx+Nh-1;

% Circularly extend the input signals
x_ext = [x, zeros(1, N - Nx)];
h_ext = [h, zeros(1, N - Nh)];

% Initialize the result array
y = zeros(1, N);

% Perform circular convolution
for n = 1:N
    for k = 1:N
        y(n) = y(n) + x_ext(k) * h_ext(mod(n - k, N) + 1);
    end
end

% To verify the result
a = conv(x,h);

% Plotting the signals

subplot(4,1,1)
stem(x)
title('First signal')
xlabel('n')
ylabel('x(n)*h(n)')

subplot(4,1,2)
stem(h)
title('Second signal')
xlabel('n')
ylabel('x(n)*h(n)')

subplot(4,1,3)
stem(y)
title('Convolued signal')
xlabel('n')
ylabel('x(n)*h(n)')

subplot(4,1,4)
stem(a)
title('Verified Convolued signal')
xlabel('n')
ylabel('x(n)*h(n)')

sgtitle('Sushant Kumar 102115212')