function [ wyjscie ] = demodulator_msk(sygnal,n,fs,T)
%n to w sumie bity
demod=zeros(1,n);
ndt=fs*T;
t=1/ndt:1/ndt:(n-1);
x2=cos(pi*t/2).*cos(2*pi*t);
y2=sin(pi*t/2).*sin(2*pi*t);
ip=sygnal.*x2;
qp=sygnal.*y2;
demod(1)=sign(sum(ip(1:100)));
for i=2:n-1
    if (mod(i,2)==1)
    demod(i)=sign(sum(ip((i-2)*ndt+1:i*ndt)));
    else
      demod(i)=sign(sum(qp((i-2)*ndt+1:i*ndt))); 
    end
end
demod(end)=sign(sum(qp(end-ndt+1:end))); 
demod=round((demod+1)/2);

 wyjscie=demod;

end

