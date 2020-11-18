% Part 1

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
