function [syg,ip,qp] = modulator_msk(bity,ndt)

%bufor([1 2 3 4 end-3 end-2 end-1 end])=[0 0 0 0 0 0 0 0 ];
%bufor
t=0:1/ndt:2-1/ndt;
%syg=zeros(1,ndt*(length(bity)+1));
IP=zeros(1,ndt*(length(bity)+1));
QP=zeros(1,ndt*(length(bity)+1));
for i=1:2:length(bity)
    j=i;
    IP((j-1)*ndt+1:(j+1)*ndt)=sin(pi*t/2+pi*(bity(i)-1)+(j-1)/2*pi);

    QP(j*ndt+1:(j+2)*ndt)=sin(pi*t/2+pi*(bity(i+1)-1)+(j-1)/2*pi);   
end 

%QP(1:ndt)=sin(pi*[-1+1/ndt:1/ndt:0]/2);
%t=1:(length(bity)+2)*ndt;
%x=cos(pi*2*1/100*t);
%y=sin(pi*2*1/100*t);

%plot(Qpre)
%syg=IP.*x+QP.*y;
%syg=syg(ndt+1:(length(bity)+1)*ndt);
%plot(syg);

t=1:(length(bity)-1)*ndt;
x=cos(pi*2*1/100*t);
y=sin(pi*2*1/100*t);
syg=IP(101:length(bity)*ndt).*x+QP(101:length(bity)*ndt).*y;
ip=IP;
qp=QP;

end
