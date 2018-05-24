clc;
clear all;
close all;
format compact;

%BPSK
signal = randi([0 1], [1 4]);
sig_mod = pskmod(signal, 2);
%scatterplot(sig_mod);
sig_demod = pskdemod(sig_mod, 2);
%scatterplot(sig_demod);

%PSK
signal = randi([0 7], [1 256]);
sig_mod = pskmod(signal, 8);
%scatterplot(sig_mod);
sig_demod = pskdemod(sig_mod, 8);
%scatterplot(sig_demod);

%OQPSK
signal = randi([0 2], [1 3]);
sig_mod = oqpskmod(signal,8);
%scatterplot(sig_mod);
sig_demod = oqpskdemod(sig_mod,8);
%scatterplot(sig_demod);
figure;

%genQAM
signal = randi([0 7], [1 256]);
sig_mod = genqammod(signal,8);
scatterplot(sig_mod);
sig_demod = genqammod(sig_mod,8);
scatterplot(sig_demod);
figure;

M = 11;
h = modem.genqammod('Constellation', exp(j*2*pi*[0:M-1]/M));
g = modem.genqamdemod('Constellation', exp(j*2*pi*[0:M-1]/M));
msg = randi([0 7], [1 256]);
modSignal = modulate(h,msg);
errSignal = (randerr(1,11, 3) ./ 30)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g,modSignal);
scatterplot(modSignal);

%MSK
h = modem.mskmod('SamplesPerSymbol', 11);
g = modem.mskdemod('SamplesPerSymbol', 11);
msg = randi([0 7], [1 256]);
modSignal = modulate(h, msg);
errSignal = (randerr(1,121, 3) ./ 15)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
