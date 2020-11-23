% Part 2

Fs = 44100;
N = Fs * 2;
n = 0:N-1;
f_analog = 440;
w_dig = 2*pi*f_analog/Fs;
x = cos(w_dig * n);

x = x / max(abs(x));
sound(x,Fs,16);