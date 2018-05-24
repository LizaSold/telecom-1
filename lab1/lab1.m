close all;
ts=0.01 % задаем частоту дискретизации
t = 0:ts:2*pi; 
N = 256;
f0 = 5;
% исходный сигнал
y = sin(2*f0*pi*t);
plot(t(1:200),y(1:200)) 
grid
% спектр исходного сигнала
figure
plot(abs(fft(y, N)))
