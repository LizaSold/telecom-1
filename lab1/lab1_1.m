close all;
tay=5*10^(-3); 
q = 5; % скважность
n=1024;
Tp=tay*q;
N=4;% число импульсов
T=N*q*tay; 
Ts=T/(n-1);
d=(0:N-1)*Tp;% вектор задержки 
t=0:Ts:T; 
A=5;
fd=(64*(2/q))/(q*tay);
% исходная последовательность импульсов
s=A*pulstran(t,d,'rectpuls', tay);
figure;
plot(t,s);
% преобразование Фурье
x=A*rectpuls(t,tay);
x=A*2*x/(q*sum(x));
f=0:fd/n:fd/2-1/n;
X=fft(x,n);
Z=abs(X);
figure;
plot(f,Z(1:length(f))), xlim([0 3/(q*tay)])