function [ output_args ] = rysuj_msk( ilosc_bitow,snr )
ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu
%ilosc_bitow=ilosc_bitow+1;
slowo_bitowe=randi(2,1,ilosc_bitow) - 1;

sygnal=modulator_msk(slowo_bitowe,ndt); 

syg_szum=awgn(sygnal,snr);

zdemodulowane_bity=demodulator_msk(syg_szum,ilosc_bitow);
st_b=zeros(1,ilosc_bitow+1);
st_b(1:ilosc_bitow)=slowo_bitowe;
st_dem=zeros(1,ilosc_bitow+1);
st_dem(1:ilosc_bitow)=zdemodulowane_bity;
figure(2)
    subplot(4,1,1)
    stairs(0:ilosc_bitow,st_b)
    axis([0 ilosc_bitow -0.2 1.2]) 
    subplot(4,1,2)
    plot(0:1/ndt:ilosc_bitow-1/ndt,sygnal)
    subplot(4,1,3)
    plot(0:1/ndt:ilosc_bitow-1/ndt,syg_szum)
    subplot(4,1,4)
    stairs(0:ilosc_bitow,st_dem)
    axis([0 ilosc_bitow -0.2 1.2]) 


end

