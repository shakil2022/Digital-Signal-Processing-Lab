clc
clear all;
close all;
N=1024;
fs=8000;
f=input('Enter the Frequency [1 to 5000]')
n=0:N-1;
x=cos(2*pi*50*(f/fs)*n);
[pxx,fre]=periodogram(x,[],N,fs);
plot(fre,10*log10(pxx));
