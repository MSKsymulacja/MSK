function [syg_szum,b] = main(ilosc_bitow,snr)
% Ilosc bitow, ktore chcemy przemodulowac
% I - tworzenie ciągu bitów 
b= randi(2,1,ilosc_bitow) - 1;     % generowanie slowa o zadanej dlugosci  

%subplot(3,1,1)
    %stairs(b,'LineWidth',3);
    %axis([1 ilosc_bitow -0.2 1.2]) 

% II - modulacja MSK
ndt=100;                        % ilosc probkowan w czasie trwania jednego bitu
sygnal=modulator(b,ndt); 

    %subplot(3,1,2)
    %plot(0:ilosc_bitow*ndt-1,sygnal)    % przedstawienie zmodulowanego sygnału

% III - przejście przez kanał AWGN
syg_szum=awgn(sygnal,snr);

    %subplot(3,1,3)
    %plot(0:ilosc_bitow*ndt-1,syg_szum)  % przedstawienie zaszumionego sygnalu
end
