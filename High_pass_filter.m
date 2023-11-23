clc
clear all
close all
rp=input('Enter the passband ripple'); 
rs=input('Enter the stopband ripple'); 
fp=input('Enter the passband frequency'); 
fs=input('Enter the stopband frequency'); 
f=input('Enter the sampling frequency'); 
wp=2*fp/f;
ws=2*fs/f;
num = -20*log10(sqrt(rp*rs))-13;
dem = 14.6*(fs-fp)/f;
n = ceil(num/dem);
n1 = n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y2=hamming(n1);
y4=hann(n1);
b=fir1(n,wp,'high',y2);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,1,1)
plot(o/pi,m);
title('Hamming window')
ylabel('Gain in db');
xlabel('Normalized Frequency');
grid on;


b=fir1(n,wp,'high',y4);
[h1,o1]=freqz(b,1,256);
m1=20*log10(abs(h1));
subplot(2,1,2)
plot(o1/pi,m1);
title('Hanning window')
ylabel('Gain in db');
xlabel('Normalized Frequency');
grid on;