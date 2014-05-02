function [ output_args ] = rysuj_msk( ilosc_bitow,snr )
ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu

slowo_bitowe=randi(2,1,ilosc_bitow) - 1;

sygnal=modulator_msk(slowo_bitowe,ndt); 

syg_szum=awgn(sygnal,snr);

zdemodulowane_bity=demodulator_msk(syg_szum,ilosc_bitow);

figure(2)
    subplot(4,1,1)
    stairs(slowo_bitowe)
    axis([1 ilosc_bitow -0.2 1.2]) 
    subplot(4,1,2)
    plot(0:1/ndt:ilosc_bitow-1/ndt,sygnal)
    subplot(4,1,3)
    plot(0:1/ndt:ilosc_bitow-1/ndt,syg_szum)
    subplot(4,1,4)
    stairs(zdemodulowane_bity)
    axis([1 ilosc_bitow -0.2 1.2]) 


end

