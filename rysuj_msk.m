function [ output_args ] = rysuj_msk( ilosc_bitow,snr )
E=1;
Tb=1;
ndt=100;                                    % ilosc probkowan w czasie trwania jednego bitu
fs=ndt/Tb;
part_size=ilosc_bitow; % podzial na czesci aby nie obciazal tak pamieci przy wiekszej ilosci bitow

    % dolozenie "sztucznych" bitow
nieparzyste=mod(part_size,2);
slowo_bitowe=randi(2,1,part_size+2+nieparzyste) - 1;    % slowo bitowe wygenerowane losowo 

faktyczne_slowo_bitowe=slowo_bitowe(2:end-1-nieparzyste);
% modulator
sygnal=2*sqrt(E/Tb)*modulator_msk(slowo_bitowe,ndt); 
%kana�
N=E*fs*10^( (-snr)/10);
sigma=sqrt(N);
szum=sigma*randn(1,(part_size+nieparzyste+1)*ndt);
syg_szum=sygnal+szum;
%demodulator
zdemodulowane_bity=demodulator_msk(syg_szum,part_size+2+nieparzyste,fs,Tb);
slowo_bitowe;
zdemodulowane_bity;
faktyczne_zdemodulowane_bity=zdemodulowane_bity(2:end-1-nieparzyste);

st_b=zeros(1,ilosc_bitow+1);
st_b(1:ilosc_bitow)=faktyczne_slowo_bitowe;
st_dem=zeros(1,ilosc_bitow+1);
st_dem(1:ilosc_bitow)=faktyczne_zdemodulowane_bity;
figure(2)
    subplot(4,1,1)
    stairs(0:ilosc_bitow,st_b)
    axis([0 ilosc_bitow -0.2 1.2]) 
    subplot(4,1,2)
    plot(0:1/ndt:ilosc_bitow-1/ndt,sygnal(ndt+1:(ilosc_bitow+1)*ndt));
    subplot(4,1,3)
    plot(0:1/ndt:ilosc_bitow-1/ndt,syg_szum(ndt+1:(ilosc_bitow+1)*ndt));
    subplot(4,1,4)
    stairs(0:ilosc_bitow,st_dem)
    axis([0 ilosc_bitow -0.2 1.2]) 


end

