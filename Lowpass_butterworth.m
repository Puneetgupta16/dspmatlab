clc
clear all
Ap=0.2;     %pass band ripple
As=40;      %stop band ripple
fp=2000;    %pass band Frequency
fs=3500;    %stop band frequency
Sf=8000;    %sampling Frequency
ds=10^(-0.05*As);
dp=10^(-0.05*Ap);
wp=(2*fp)/Sf;
ws=(2*fs)/Sf;
N1=0.5*log10(((1/ds^2)-1)/((1/dp^2)-1))/(log10(ws/wp));
N=ceil(N1);
wc=wp/((1/dp^2)-1)^(1/(2*N));
[b,a,k]=butter(N,wc,'low');
tf1=zp2tf(b,a,k);
fvtool(tf1);
%[bz,az]=impinvar(b,a,1);
%tf2=zp2tf(bz',az',k);
%fvtool(tf2);