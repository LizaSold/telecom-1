X = [ 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ] ;
Y = [ 1 0 1 ] ;
tic;
[cross, lags] = xcorr(X,Y) ;
time = toc ;

figure
stem ( lags, cross , 'm' ) ;
disp ( 'Normal correlation: ' ) ;
disp ( time ) ;

tic;
fast_corr = ifft ( fft ( X ) .*conj ( fft( Y, 16 ) ) ) ;
time = toc ;

figure
stem ( fast_corr , 'g' ) ;
disp ( 'Fast correlation: ' ) ;
disp ( time ) ;
