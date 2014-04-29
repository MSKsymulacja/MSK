function [ wyjscie ] = demodulator_msk(sygnal,n)
demod=zeros(1,n);
ndt=100;
t100=1/100:1/100:1;
for i=1:n   
    if mod(i,2)==1
       mnozenie=times(sygnal((i-1)*ndt+1:i*100) , sin(2*pi*3/4*t100) );
       calka0=abs(sum(mnozenie));

        mnozenie=times( sygnal((i-1)*ndt+1:i*100) , sin(2*pi*5/4*t100) );
        calka1=abs(sum(mnozenie));
    else
        mnozenie=times(sygnal((i-1)*ndt+1:i*100) , cos(2*pi*3/4*t100) );
       calka0=abs(sum(mnozenie));
       
        mnozenie=times( sygnal((i-1)*ndt+1:i*100) , cos(2*pi*5/4*t100) );
        calka1=abs(sum(mnozenie));    
        end
    if calka0>calka1
        demod(i)=0;
    else
        demod(i)=1;
    end
    wyjscie=demod;

end

