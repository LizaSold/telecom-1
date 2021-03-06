clc;
clear all;
close all;
format compact;

N=256;
t=0:0.01:2*pi;
f0=0.5;
fc=5;
fs=110;
x=cos(2*pi*f0*t);
figure;
plot(t,x);
% ����������� ���������
y=ammod(x, fc, fs, 0, 0.7);
figure;
subplot(2,1,1);
plot (t, y);
subplot(2,1,2);
plot(abs(fft(y, N)));
% ����������� ��������� � ����������� �������
y1=ammod(x, fc, fs);
figure;
subplot(2,1,1);
plot (t, y1);
subplot(2,1,2);
plot(abs(fft(y1, N)));
%������������ ���������
z=ssbmod(x,fc,fs,0,'upper');
figure;
subplot(4,1,1);
plot (t, x);
subplot(4,1,2);
plot (t, z);
subplot(4,1,3);
plot(abs(fft(z, N)));
xorig = demod(z,fc,fs);
subplot(4,1,4);
plot(t,xorig);
%��� ���������
M = fc/0.7;
kpd = M^2/(M^2 + 2)
%������� ���������
y_pm=pmmod(x,fc,fs,pi/2);
figure;
subplot(3,1,1);
plot(t,x,'r',t,y_pm,'m');
subplot(3,1,2);
plot(abs(fft(y_pm, N)));
%������� �����������
y_pmd=pmdemod(y_pm,fc,fs, pi/2);
subplot(3,1,3);
plot(t,x,'.-',t,y_pmd,'m');
figure;
y_fm=fmmod(x,fc,fs,3);
subplot(3,1,1);
plot(t,x,'r',t,y_fm,'m');
subplot(3,1,2);
plot(abs(fft(y_fm, N)));
y_fmd=fmdemod(y_fm,fc,fs, 3);
subplot(3,1,3);
plot(t,x,'.-',t,y_fmd,'m');
