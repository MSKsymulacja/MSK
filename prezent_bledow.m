function [] = prezent_bledow( b,demod,sygnal,wyjscie )
%funkcja graficznie przedstawia miejsca bledow w dzialaniu demodulatora, dla zadanych parametrow:
%b-slowo wlasciwe
%demod-slowo bitowe zdemodulowane
%sygnal-zaszumiony sygnal
%wyjscie-odfiltrowany sygnal
ndt=100;
blzn=b-demod;
bledy=abs(b-demod);
nb=sum(bledy)
znacznik=0;
znacznik2=0;
for i=1:length(b)
    if blzn(i)==-1
       znacznik=i;
    end
    if blzn(i)==1
        znacznik2=i;
    end
end

  close all
if znacznik~=0
  figure(1)
  set(gcf, 'name', '0 odczytane jako 1')
  subplot(2,1,1)
  plot(sygnal((znacznik-2)*ndt:(znacznik+1)*ndt-1))
  subplot(2,1,2)
  plot(wyjscie((znacznik-2)*ndt:(znacznik+1)*ndt-1))
  hold on
  plot(zeros(1,300))
  x=[100,100];
y=[-1.2,1.2];
plot(x,y)
  x=[200,200];
y=[-1.2,1.2];
plot(x,y)

b(znacznik-1:znacznik+1)
demod(znacznik-1:znacznik+1)
end

if znacznik2~=0
figure(2)
set(gcf, 'name', '1 odczytane jako 0')
  subplot(2,1,1)
  plot(sygnal((znacznik2-2)*ndt:(znacznik2+1)*ndt-1))
  subplot(2,1,2)
  plot(wyjscie((znacznik2-2)*ndt:(znacznik2+1)*ndt-1))
  hold on
  plot(zeros(1,300))
    x=[100,100];
y=[-1.2,1.2];
plot(x,y)
  x=[200,200];
y=[-1.2,1.2];
plot(x,y)
b(znacznik2-1:znacznik2+1)
demod(znacznik2-1:znacznik2+1)
end

end

