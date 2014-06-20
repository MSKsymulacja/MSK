function [error] = glowny_msk( ilosc_bitow,snr )
E=1;
Tb=1;
ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu
fs=ndt/Tb;
part_size=1e4; % podzial na czesci aby nie obciazal tak pamieci przy wiekszej ilosci bitow
part_n=floor(ilosc_bitow/part_size);
if part_n<1
    part_n=1;
    part_size=0;
end

suma_err=0;
for i=1:part_n
    
    if i==part_n
        part_size=part_size+mod(ilosc_bitow,part_size);
    end
    
    % dolozenie "sztucznych" bitow
nieparzyste=mod(part_size,2);

slowo_bitowe=randi(2,1,part_size+2+nieparzyste) - 1;    % slowo bitowe wygenerowane losowo 

faktyczne_slowo_bitowe=slowo_bitowe(2:end-1-nieparzyste);
% modulator
sygnal=2*sqrt(E/Tb)*modulator_msk(slowo_bitowe,ndt); 
%kana³
N=E*fs*10^( (-snr)/10);
sigma=sqrt(N);
szum=sigma*randn(1,(part_size+nieparzyste+1)*ndt);
syg_szum=sygnal+szum;
%demodulator
zdemodulowane_bity=demodulator_msk(syg_szum,part_size+2+nieparzyste,fs,Tb);
slowo_bitowe;
zdemodulowane_bity;
faktyczne_zdemodulowane_bity=zdemodulowane_bity(2:end-1-nieparzyste);
blad=faktyczne_zdemodulowane_bity-faktyczne_slowo_bitowe;
ber=(sum(blad==1)+sum(blad==-1))/ilosc_bitow;
suma_err=suma_err+ber;
end
error=suma_err;
end

