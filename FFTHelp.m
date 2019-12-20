SampRate = 6000;
TotalTime = 0.05;
N = 1024;
t = 0:1/SampRate:TotalTime;
x = sin(2*pi*100*t)+sin(2*pi*500*t) + sin(2*pi*1000*t);
y = x;
subplot(2, 1, 1)
plot(1000*t,y)
title('100, 500, and 1000 Hz Sine Waves')
xlabel('time (milliseconds)')

Y = fft(y,N);
Z = abs(fft(y,N));

Pyy = Y.* conj(Y) / N;

f = SampRate*(0:N/2)/N;
subplot(2, 2, 3)
plot(f,Pyy(1:N/2+1))
title('Power content of y')
xlabel('frequency (Hz)')

subplot(2, 2, 4)
plot(f,Z(1:N/2+1))
title('FFT content of y')
xlabel('frequency (Hz)')