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


%genQAM
signal = randi([0 7], [1 256]);
sig_mod = genqammod(signal, exp(j*[0:7]));
scatterplot(sig_mod);
sig_demod = genqamdemod(sig_mod,exp(j*[0:7]));
scatterplot(sig_demod);


%MSK
signal = randi([0 1], [1 256]);
sig_mod = mskmod(signal, 16);
scatterplot(sig_mod);
sig_demod = mskdemod(sig_mod, 16);
scatterplot(sig_demod);

