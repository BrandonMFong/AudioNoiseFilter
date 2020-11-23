% Part 2

% Get audio file
[xin,Fs] = audioread('res/proj3_noisysig.wav');
sound(xin,Fs,16);

% Plot
Xin = fftshift(fft(xin));
Xmag = abs(Xin);
XmagdB = 20*log10(Xmag);

% plot against radian digital frequency
n = (length(xin) - 1)/2;
f = (-n:n)/n/2;
figure(16);
plot(f,XmagdB);
ylabel('Mag (dB)');

% Design filter
Wp = 2*1000/Fs; % TODO
Ws = 2*3000/Fs; % TODO 
Rp = 1;
Rs = 60;
[Nf, Wn] = buttord(Wp,Ws,Rp,Rs);
[num,den] = butter(Nf,Wn);

% Apply filter
yout = filter(num,den,xin);
yout = yout / max(abs(yout));

