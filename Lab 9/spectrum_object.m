% This file calculates the Magnitude Spectrum and Power Spectrum Density of
% the speech signal
%
% Lecture Series: Speech & Audio Signal Processing
% Created By: JCBRO Labs
% Date: 14/05/2017
% website: www.jcbrolabs.org
% mail: jcbrolabs@gmail.com

close all; clear all;

%% Read signal

[data,fs] = audioread('file_example_WAV_1MG.wav');
%% or record data
% fs = 44100;
% rec = audiorecorder(fs, 16, 1);
% % start recording
% disp('start speaking');
% % record(rec, 5); % will record for 5sec. for this command pause needs to be added
% recordblocking(rec, 2);
%
% % stop recording
% disp('Stop recording');
%
% % get data
% data = getaudiodata(rec);

%% take fourier transform and plot single sided spectrum
l = length(data);
NFFT = 2^nextpow2(l);
f = fs/2*linspace(0,1,NFFT/2+1);
xf = abs(fft(data, NFFT));

subplot(2,1,1);plot(data);title('Input Speech Signal');
subplot(2,1,2);plot(f, xf(1:NFFT/2+1));title('Single Sided Spectrum of the Speech Signal');

% plot PSD (using welch method)
h = spectrum.welch; % create welch spectrum object
d = psd(h, data,'Fs', fs);
figure;
plot(d);

% Plot PSD (From FFT)
% single sided PSD
Hpsd = dspdata.psd(xf(1:length(xf)/2),'Fs',fs);
figure;plot(Hpsd);

% Periodogram Based PSD estimate
figure;
[psdestx,Fxx] = periodogram(data,rectwin(length(data)),length(data),fs);
plot(Fxx,10*log10(psdestx)); grid on;
xlabel('Hz'); ylabel('Power/Frequency (dB/Hz)');
title('Periodogram Power Spectral Density Estimate');
