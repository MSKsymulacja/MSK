function [ output_args ] = rysuj2_msk( slowo_bitowe,snr )
ndt=100;                                   % ilosc probkowan w czasie trwania jednego bitu

%doda�em bit wychodz�cy poza d�ugo�� podanego s�owa bitowego, kt�ry jest
%taki sam jak bit ostatni w tym s�owie, dzi�ki temu mo�na narysowa� wykres
%poprawnie (schodki)

%nie poprawia�em jednak innych wykres�w - do poprawki

%slowo_bitowe=randi(2,1,ilosc_bitow) - 1;
ilosc_bitow=length(slowo_bitowe);
sygnal=modulator_msk(slowo_bitowe,ndt); 
syg_szum=awgn(sygnal,snr);
zdemodulowane_bity=demodulator_msk(syg_szum,ilosc_bitow);

st_b=zeros(1,ilosc_bitow+1);
st_b(1:ilosc_bitow)=slowo_bitowe;
st_dem=zeros(1,ilosc_bitow+1);
st_dem(1:ilosc_bitow)=slowo_bitowe;

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

