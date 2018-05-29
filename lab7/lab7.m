clear all;
close all;
%Код Хэмминга
%использование стандартных функций
msg = [0 1 1 1]
code = encode(msg,7,4)
code(1) = not(code(1))
[dec,err] = decode(code,7,4)
%использование проверочной и генераторной матриц и вычисление синдрома
msg = [0 1 1 1]
[h,g,n,k] = hammgen(3)
m = msg*g;
m = rem(m,ones(1,n).*2);
m(4) = not(m(4));
synd = m*h';
synd = rem(synd,ones(1,n-k).*2)
stbl = syndtable(h);
tmp = bi2de(synd,'left-msb')
z = stbl(tmp+1,:)
rez = xor(m,z)

% Циклический код
msg = [0 1 1 1]
pol = cyclpoly(7,4)
[h,g] = cyclgen(7,pol);
code = msg*g;
code = rem(code,ones(1,n).*2);
code(2) = not(code(2));
synd = code*h';
synd = rem(synd,ones(1,n-k).*2);
stbl = syndtable(h);
tmp = bi2de(synd,'left-msb')
z = stbl(tmp+1,:)
rez = xor(code,z)

%Код БЧХ
msg = [0 1 1 1]
codebch = comm.BCHEncoder(7,4)
decbch = comm.BCHDecoder(7,4)
temp = msg';
code = step (codebch , temp(:))'
code(2) = not(code(2))
decode = step (decbch , code')'

%Код Рида-Соломона
m = 3;
n = 2^m - 1;
k = 3;
msg = gf([0 1 2; 3 4 5; 6 7 6],m)
code = rsenc(msg,n,k)
errs = gf([0 0 0 4 0 0 0; 2 0 0 0 2 0 0; 3 4 5 0 0 0 0 ],m);
code = code + errs
[dec,errnum] = rsdec(code,n,k)

