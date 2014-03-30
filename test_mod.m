function [ber] = test_mod(n,snr)
ndt=100;
[sygnal,b]=main(n,snr);
zera=zeros(1,ndt*n);
W1=[1/150 1/75];
wyjscie=filtracja(sygnal,100,W1);
demod=zeros(1,n);
    for i=1:n
        porownanie=sign(wyjscie((i-1)*ndt+10));
        licznik=0;
        for j=20:10:90
            if sign(wyjscie((i-1)*ndt+j))~=porownanie
               licznik=licznik+1;
            end
            porownanie=sign(wyjscie((i-1)*ndt+j));            
        end
        if licznik <=1
            demod(i)=0;
        else
            demod(i)=1;
        end
    end
bledy=abs(b-demod);
nb=sum(bledy);

%prezent_bledow(b,demod,sygnal,wyjscie) %- funckja graficznie prezentuje
                                        %po bledzie odczytania 
                                        %0 jako 1 i odwrotnie

if nb~=0
ber=nb/n;
else
    ber=0;
end
end

