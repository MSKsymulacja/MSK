function [] = main(ilosc_bitow)
% Ilość bitów, które chcemy przemodulować
% I - tworzenie ciągu bitów 
b= randi(2,1,ilosc_bitow) - 1;      % generowanie słowa o zadanej długości  

subplot(3,1,1)
stairs(b,'LineWidth',3);
axis([1 ilosc_bitow -0.2 1.2]) 

% II - modulacja MSK
ndt=100;                        % ilość próbkowań w czasie trwania jednego bitu
sygnal=modulator(b,ndt); 

subplot(3,1,2)
plot(0:ilosc_bitow*ndt-1,sygnal)    % przedstawienie zmodulowanego sygnału

% III - przejście przez kanał AWGN
snr=3;
syg_szum=awgn(sygnal,snr);

subplot(3,1,3)
plot(0:ilosc_bitow*ndt-1,syg_szum)  % przedstawienie zaszumionego sygnału
end
