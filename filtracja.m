function [ wyjscie ] = filtracja(sygnal,N,W)
%Tworzy filtr o zadanych W=[Wmin Wmax] i rzedzie N
%Nastepnie filtruje sygnal
%Zwraca wyjscie filtru z pominieciem poczatkowych probek
filtr=fir1(N,W);
wejscie=zeros(1,length(sygnal)+floor(N/2));
wejscie(1:length(sygnal))=sygnal;

wyj=filter(filtr,1,wejscie);
wyjscie=wyj(floor(N/2)+1:length(sygnal)+floor(N/2));

end

