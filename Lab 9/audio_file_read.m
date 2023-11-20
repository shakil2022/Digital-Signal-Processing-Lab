close all; clear all;
% read .wav file
[data,fs] = audioread('file_example_WAV_1MG.wav');
% read .mp3 file
[x, fs1] = audioread('file_example_WAV_1MG.wav');
% play audio files
%player=sound(data,fs); %one method
% play audio files by another method
player = audioplayer(x,fs1);
play(player);
pause(5);
pause(player);
pause(5);
stop(player);
% plot signal
plot(x); title('Input Sound File');
