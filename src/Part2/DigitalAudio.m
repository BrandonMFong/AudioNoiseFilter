% Part 2

% Step 5
Fs = const.Part2.Step5.SamplingFreq;
N = Fs * 2;
n = 0:N-1;
% f_analog = 440;
f_analog = const.Part2.Step5.f_analog1;
w_dig = 2*pi*f_analog/Fs;
x = cos(w_dig * n);

x = x / max(abs(x));
sound(x,Fs,16);

X = fftshift(fft(x));
Xmag = abs(X);
XmagdB = 20*log10(Xmag);

% plot against radian digital frequency
% w = -pi:2*pi/N:pi-2*pi/N;
w = eval(const.Part2.Step5.Plot13.min):eval(const.Part2.Step5.Plot13.inc):eval(const.Part2.Step5.Plot13.max);
f = w * Fs / (2*pi);
figure(13);
plot(f,XmagdB);
xlim(eval(const.Part2.Step5.Plot13.xlim));
title(const.Part2.Step5.Plot13.Title);
xlabel(const.Part2.Step5.Plot13.xaxisName);
ylabel(const.Part2.Step5.Plot13.yaxisName);

% normalized digital frequency
figure(14);
plot(w,XmagdB);
xlim(eval(const.Part2.Step5.Plot14.xlim));
title(const.Part2.Step5.Plot14.Title);
xlabel(const.Part2.Step5.Plot14.xaxisName);
ylabel(const.Part2.Step5.Plot14.yaxisName);

% wait
pause(3);

audiowrite(strcat('res\',const.Part2.Step5.AudioFileName),x,Fs);
[x2,Fs] = audioread(const.Part2.Step5.AudioFileName);
sound(x2,Fs,16);

% % Lowpass digital butterworth filter
% Wp = 0.4;
% Ws = 0.6;
% Rp = 1;
% Rs = 60;
% [low_Nf, low_Wn] = buttord(Wp,Ws,Rp,Rs);
% [low_num,low_den] = butter(low_Nf,low_Wn);

% % Highpass digital butterworth filter 
% Wp = 0.6;
% Ws = 0.4;
% Rp = 1;
% Rs = 60;
% [Nf,Wn] = buttord(Wp,Ws,Rp,Rs);
% [num,den] = butter(Nf,Wn,'high');

% Step 6
Fs = const.Part2.Step6.SamplingFreq;
N = Fs * 4;
n = 0:N-1;

% 250 Hz
f_analog = const.Part2.Step6.f_analog1;
w_dig = 2*pi*f_analog/Fs;
x1 = cos(w_dig * n);
sound(x1,Fs,16);
pause(5);

% sweeping 1kHz to 3kHz
% f_start_analog = 1000;
% w_start_dig = 2*pi*f_start_analog/Fs;
% f_stop_analog = 3000;
% w_stop_dig = 2*pi*f_stop_analog/Fs;
% phi = (w_stop_dig - w_start_dig)/(2*(N-1))*(n.*n) + w_start_dig*n;
% x2 = cos(phi);
f_analog = const.Part2.Step6.f_analog2; % changing to 3000 hertz
w_dig = 2*pi*f_analog/Fs;
x2 = cos(w_dig * n);
sound(x2,Fs,16);
pause(5);

% Add the two signals
x3 = x1 + x2; % literally just on top of the other audio
x3 = x3 / max(abs(x3));
sound(x3,Fs,16);
pause(5);

% Lowpass Use
% Will just not include the pi in the equation
Wp = 2*const.Part2.Step6.f_analog1/Fs; 
Ws = 2*const.Part2.Step6.f_analog2/Fs;
Rp = const.Part2.Step6.PassbandRipple;
Rs = const.Part2.Step6.StopbandAttenuation;
[Nf, Wn] = buttord(Wp,Ws,Rp,Rs);
[num,den] = butter(Nf,Wn);
h = fvtool(num,den);
figure(15);
freqz(num,den,1024);
title(const.Part2.Step6.Plot15.Title);
y1 = filter(num,den,x3);
y1 = y1 / max(abs(y1));
sound(y1,Fs,16);
pause(5);

% % Highpass use
% Ws = w_dig/pi;
% Wp = w_start_dig/pi;
% Rp = 1;
% Rs = 60;
% [Nf,Wn] = buttord(Wp,Ws,Rp,Rs);
% [num2,den2] = butter(Nf,Wn,'high');
% Hd = dfilt.df1(num2,den2);
% addfilter(h,Hd);
% figure(16);
% freqz(num2,den2,1024);
% title('Highpass Frequency Response');
% y2 = filter(num2,den2,x3);
% y2 = y2/max(abs(y2));
% sound(y2,Fs,16);