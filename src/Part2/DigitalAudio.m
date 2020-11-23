% Part 2

Fs = 44100;
N = Fs * 2;
n = 0:N-1;
f_analog = 440;
w_dig = 2*pi*f_analog/Fs;
x = cos(w_dig * n);

x = x / max(abs(x));
sound(x,Fs,16);

X = fftshift(fft(x));
Xmag = abs(X);
XmagdB = 20*log10(Xmag);

% plot against radian digital frequency
w = -pi:2*pi/N:pi-2*pi/N;
f = w * Fs / (2*pi);
figure(13);
plot(f,XmagdB);
xlim([-20000 20000]);
title('Centered DFT Magnitude for 440 Hz Pure Tone');
xlabel('analog frequency, Hz');
ylabel('dB');

% normalized digital frequency
figure(14);
plot(w,XmagdB);
xlim([-pi pi]);
title('Centered DFT Magnitude for 440 Hz Pure Tone');
xlabel('radian digital frequency \omega');
ylabel('dB');

% wait
pause(3);

audiowrite('res/A-440.wav',x,Fs);
[x2,Fs] = audioread('A-440.wav');
sound(x2,Fs,16);
