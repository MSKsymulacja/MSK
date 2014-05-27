function [error] = glowny_msk( ilosc_bitow,snr )

ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu
part_size=1e4; % podzial na czesci aby nie obciazal tak pamieci przy wiekszej (1e6) ilosci bitow
part_n=floor(ilosc_bitow/part_size);
suma_err=0;
for i=1:part_n
    
    if i==part_n
        part_size=part_size+mod(ilosc_bitow,part_size);
    end
slowo_bitowe=randi(2,1,part_size) - 1;    % slowo bitowe wygenerowane losowo 

sygnal=modulator_msk(slowo_bitowe,ndt); 

syg_szum=awgn(sygnal,snr);

zdemodulowane_bity=demodulator_msk(syg_szum,part_size);

blad=zdemodulowane_bity-slowo_bitowe;
ber=(sum(blad==1)+sum(blad==-1))/ilosc_bitow;
suma_err=suma_err+ber;
end
error=suma_err;
end

