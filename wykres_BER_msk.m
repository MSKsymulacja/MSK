function [] = wykres_BER_msk( n_probek,wektor_SNR)
%funkcja szkicuje wykres Bit Error Rate demodulacji MSK, liczony z n_probek, w funkcji wartosci Signal To Noise Ratio[dB]
%zadanych wektorem wektor_SNR

BER=zeros(1,length(wektor_SNR));
for i=1:length(wektor_SNR)
   BER(i)=glowny_msk(n_probek,wektor_SNR(i));
end
semilogy(wektor_SNR,BER,'*r');
xlabel('SNR');
ylabel('BER');

end

