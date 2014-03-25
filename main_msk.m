% I - tworzenie ciągu bitów 
dlugosc=10;
b= randi(2,1,dlugosc) - 1;      % generowanie słowa o zadanej długości  

subplot(3,1,1)
stairs(b);
axis([1 dlugosc -0.2 1.2]) 

% II - modulacja MSK
ndt=100;                        % ilość próbkowań w czasie trwania jednego bitu
sygnal=msk_mod(b,ndt); 

subplot(3,1,2)
plot(0:dlugosc*ndt-1,sygnal)    % przedstawienie zmodulowanego sygnału

% III - przejście przez kanał AWGN
snr=3;
syg_szum=awgn(sygnal,snr);

subplot(3,1,3)
plot(0:dlugosc*ndt-1,syg_szum)  % przedstawienie zaszumionego sygnału
