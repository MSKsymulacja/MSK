function [ ber ] = test_mod2(n,snr)
ndt=100;
[sygnal,slowo]=main(n,snr);
zera=zeros(1,ndt*n);
W0=[0.016 0.018];
W1=[0.024 0.026];

wyjscie0=filtracja(sygnal,100,W0);
wyjscie1=filtracja(sygnal,100,W1);

%subplot(3,1,1)
%plot(abs(fft(wyjscie0,1000)))
%subplot(3,1,2)
%plot(abs(fft(wyjscie1,1000)))
%subplot(3,1,3)
%plot(sygnal)
demod=zeros(1,n);
for i=1:n
max1=max(abs(fft(wyjscie1((i-1)*ndt+1:i*ndt),1000)));
max0=max(abs(fft(wyjscie0((i-1)*ndt+1:i*ndt),1000)));
demod(i)=(sign(max1-max0)+1)/2;
end
blad=demod-slowo;
ber=(sum(blad==1)+sum(blad==-1))/n;
end

