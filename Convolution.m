clc
clear all
n = 0:4;
x = (n>=0)-(n>=4);
subplot(3,1,1)
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('Signal 1')
subplot(3,1,2)
n = 0:8;
y = n.*(n>=0)-2*(n-4).*(n>=4)+(n-8).*(n>=8);
stem(n,y);
xlabel('n');
ylabel('y[n');
title('Signal 2')
l1 = length(x);
l2 = length(y);
X = [x, zeros(1,10)];
Y = [y, zeros(1,6)];
for i=1:(l1+l2-1)
    c(i) = 0;
    for j = 1:i
        c(i) = c(i)+X(j).*Y(i-j+1);
    end
end
subplot(3,1,3)
stem(c);
xlabel('n');
ylabel('x[n]*y[n]')
title('final convolued signal')
sgtitle('Puneet Gupta 102115213')
