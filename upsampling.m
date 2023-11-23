clc
clear all;
N=input('enter length of sequence=');
n=0:N-1;

f1=input('enter normalised frequency1:');
x1=sin(2*pi*f1*n);

f2=input('enter normalised frequency2:');
f3=input('enter normalised frequency3:');
x2=sin(2*pi*f2*n);
x3=sin(2*pi*f3*n);

x4=sin(2*pi*f2*n)+sin(2*pi*f3*n);

M=input('enter upsamplimng factor');

y1=upsample(x1,M);
L1=length(y1);
y4=upsample(x4,M);
L4=length(y1);
subplot(2,2,1)
stem(0:N-1,x1(1:N));
xlabel('n');
ylabel('x1(n)')
title('input signal');
grid on;
subplot(2,2,2)
stem(0:N-1,x4(1:N));
xlabel('n');
ylabel('x4(n)');
title('sum of two sin signal');
grid on;
subplot(2,2,3)
stem(0:L1-1,y1(1:L1));
xlabel('n');
ylabel('y1(n)');
title('Upsampeling input signal');
grid on;
subplot(2,2,4)
stem(0:L4-1,y4(1:L4));
xlabel('n');
ylabel('y4(n)');
title('Upsamepling sum of two sin signal');
sgtitle('Puneet Gupta 102115215')
grid on;