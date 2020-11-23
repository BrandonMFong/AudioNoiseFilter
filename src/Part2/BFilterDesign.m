% Part 2

% Get audio file
[xin,Fs_Bfilter] = audioread('res/proj3_noisysig.wav');
% sound(xin,Fs,16);

% Plot
Xin = fftshift(fft(xin));
Xmag = abs(Xin);
XmagdB = 20*log10(Xmag);

% plot normalized digital frequency
n = (length(xin) - 1)/2;
f = (-n:n)/n;
figure(16);
plot(f,XmagdB);
ylabel('Mag (dB)');

% Design filter
Wp = 0.4;
Ws = 0.6; % TODO 
Rp = 1;
Rs = 60;
[Nf, Wn] = buttord(Wp,Ws,Rp,Rs);
[num,den] = butter(Nf,Wn);
figure(17);
freqz(num,den,1024);

% Apply filter
yout = filter(num,den,xin);
yout = yout / max(abs(yout));
sound(yout,Fs_Bfilter,16);
% audiowrite('output/filteredsig.wav', yout, Fs_Bfilter);

