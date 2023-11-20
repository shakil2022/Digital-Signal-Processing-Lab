clc;
clear all;
close all;

n = 20;
fp = 200;
fq = 300;
fs = 1000;
fn = 2 * fp / fs;

window = ones(n + 1, 1);
b = fir1(n, fn, window);
[H, W] = freqz(b, 1, 128);

subplot(2, 1, 1);
plot(W / pi, abs(H));
title('Magnitude response of LPF');
ylabel('Gain in dB');
xlabel('Normalized frequency');

subplot(2, 1, 2);
plot(W / pi, angle(H));
title('Phase response of LPF');
ylabel('Angle');
xlabel('Normalized frequency');