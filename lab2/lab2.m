close all;
x = [ 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ];
y = [ 1 0 1 ];
figure;
tic;
Corr_cross = xcorr(x,y);
time = toc
subplot(2,1,1)
plot(1:length(Corr_cross),Corr_cross);

tic;
Corr_fast = ifft(fft(x).*conj(fft(y,16)));
time = toc
subplot(2,1,2)
plot(1:length(Corr_fast),Corr_fast);
