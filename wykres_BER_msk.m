function [] = wykres_BER_msk( n_probek,wektor_SNR,alfa)
%funkcja szkicuje wykres Bit Error Rate demodulacji MSK, liczony z n_probek, w funkcji wartosci Signal To Noise Ratio[dB]
%zadanych wektorem wektor_SNR

BER=zeros(1,length(wektor_SNR));
gorny=zeros(1,length(wektor_SNR));
dolny=zeros(1,length(wektor_SNR));
h=waitbar(0,'Rysujê wykres BER');
for i=1:length(wektor_SNR)
      if ~ishandle(h)
              break
        end
        waitbar(i/length(wektor_SNR))
    
   BER(i)=glowny_msk(n_probek,wektor_SNR(i));
   [gorny(i),dolny(i)]=wilson_conf(BER(i)*n_probek,n_probek,alfa);
end

 if ~ishandle(h)
     h=msgbox('Przerwano');
    return
  else
           close(h);

g=max(wektor_SNR);
d=min(wektor_SNR);
tru=zeros(1,length(d:g));
EdoN=10.^( ((d:g))/10);
tru=1/2*erfc(sqrt(EdoN));
    figure(2)
semilogy(wektor_SNR,BER,'*b-',wektor_SNR,dolny,'*g-',wektor_SNR,gorny,'*r-',d:g,tru,'k');
lala=xlabel('SNR');
set(lala,'FontAngle','italic')
lulu=ylabel('BER');
set(lulu,'FontAngle','italic')
hleg1 = legend('Zmierzony BER','Górny przedzia³ Wilsona','Dolny przedzia³ Wilsona','Teoretyczne wartoœci BER');
set(hleg1,'Location','SouthOutside')
set(hleg1,'FontAngle','italic')
       end
end

