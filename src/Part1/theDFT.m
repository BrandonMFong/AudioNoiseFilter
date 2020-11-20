% Part 1

% Step 1
% Init variables with .json config
n = const.Part1.min:const.Part1.max;
x1n = eval(const.Part1.array);
X1k = fft(x1n);
X1kmag = abs(X1k);
X1karg = angle(X1k);

% Plotting original signal
figure(1);
stem(n,x1n);
axis(eval(const.Part1.Plot1.axisRanges));
title(const.Part1.Plot1.Title);
xlabel(const.Part1.Plot1.xaxisName);
ylabel(const.Part1.Plot1.yaxisName);

% plot DFT frequency spectrum 
k = 0:7;

figure(2);
stem(k,X1kmag);ylim(eval(const.Part1.Plot2.yaxisLimit));
title(const.Part1.Plot2.Title);
xlabel(const.Part1.Plot2.xaxisName);
ylabel(const.Part1.Plot2.yaxisName);

figure(3);
stem(k,X1karg);
title(const.Part1.Plot3.Title);
xlabel(const.Part1.Plot3.xaxisName);
ylabel(const.Part1.Plot3.yaxisName);

% DFT mag as function of Matlab index
Matlab_idx = [const.Part1.Plot4.min:const.Part1.Plot4.max];
figure(4);
stem(Matlab_idx,X1kmag); ylim(eval(const.Part1.Plot4.yaxisLimit));
title(const.Part1.Plot4.Title);
xlabel(const.Part1.Plot4.xaxisName);
ylabel(const.Part1.Plot4.yaxisName);

% plot DFT mag as a function of discrete freq
% radians per sample
w = [eval(const.Part1.Plot5.min):eval(const.Part1.Plot5.inc):eval(const.Part1.Plot5.max)];
figure(5);
stem(w,X1kmag);ylim(eval(const.Part1.Plot5.yaxisLimit));
title(const.Part1.Plot5.Title); ylim(eval(const.Part1.Plot5.yaxisLimit));
xlabel(const.Part1.Plot5.xaxisName);
ylabel(const.Part1.Plot5.yaxisName);

% Compute and plot the IDFT
x2n = ifft(X1k);
figure(6);
stem(n,x2n);
axis(eval(const.Part1.Plot6.axisRanges));
title(const.Part1.Plot6.Title);
xlabel(const.Part1.Plot6.xaxisName);
ylabel(const.Part1.Plot6.yaxisName);

% Step 2
% Centering the DFT
X1kshift = fftshift(fft(x1n));
X1kmag_centered = abs(X1kshift);
X1karg_centered = angle(X1kshift);
x2n = ifft(ifftshift(X1kshift));

% Plot the centered magnitude and phase as function of the radian frequency 

% Mag
w = [-4*2*pi/8:2*pi/8:3*2*pi/8];
figure(7);
stem(w,X1kmag_centered);
title('Centered');
xlabel('w');
ylabel('Centered Mag');

% Phase 
figure(8);
stem(w,X1karg_centered);
title('Centered Angle');
xlabel('w');
ylabel('Centered Angle');
