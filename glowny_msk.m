function [error] = glowny_msk( ilosc_bitow,snr )

ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu

slowo_bitowe=randi(2,1,ilosc_bitow) - 1;    % s³owo bitowe wygenerowane losowo 
%!!! trzeba za³o¿yæ te¿ mo¿liwoœæ rêcznego wprowadzania !!! %

sygnal=modulator_msk(slowo_bitowe,ndt); 

syg_szum=awgn(sygnal,snr);

zdemodulowane_bity=demodulator_msk(syg_szum,ilosc_bitow);

blad=zdemodulowane_bity-slowo_bitowe;
ber=(sum(blad==1)+sum(blad==-1))/ilosc_bitow;
error=ber;
end

