function [ ilosc,ber_koncowy,gorny_przedzial,dolny_przedzial ] = zmienna_il( szer,snr,alfa )
        n=10;
        suma=0;
        il_b=0;
        up_down=1;
        while (up_down>szer)
            ber=glowny_msk(n,snr);
            il=ber*n;
            il_b=il_b+il;
            suma=suma+n;
            [d,u]=wilson_conf(il_b,suma,alfa);
            up_down=u-d;
            n=10^floor(log10(suma)); % jesli bylo 100 to n=100 jak dojdzie do 1000 to n=1000 itd.
        end
ilosc=suma;
ber_koncowy=il_b/ilosc;
gorny_przedzial=u;
dolny_przedzial=d;
end

