clc
clear all
wp1 = 0.1*pi;
wp2 = 0.6*pi;
ws1 = 0.06*pi;
ws2 = 0.*pi;
wc1 = (wp1+ws1)/2;
wc2 = (wp2+ws2)/2;

m = 49;
n = linspace(0,m-1,m);
hd1 = sin(wc2*(n-(m-1)/2))./(pi*(n-((m-1)/2)));
hd1(((m-1)/2)+1)=wc2/pi;
hd2 = sin(wc1*(n-(m-1)/2))./(pi*(n-((m-1)/2)));
hd2(((m-1)/2)+1)=wc1/pi;
h = hd2-hd1;

beta = 1;
wi = kaiser(m,beta);
wii = [];
for i = 1:length(wi)
    wii(1,i)=wi(i,1);
end

h = h.*wii;

[H,w]=freqz(h,1,1024);
wn = w/(w*pi);
hn = abs(H)./max(abs(H));
hn1 = 20*log10(hn);
plot(wn,hn1,'r')
grid
xlabel('\bf Normalized Frequency')
ylabel('\bf Normalized Frequency response (db)')
title('\bf Bandpass filter via kaiser window')


