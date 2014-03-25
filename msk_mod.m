function [syg] = msk_mod(bity,ndt)
%t=[0:0.05:length(bity)];
t=0:1/ndt:1-1/ndt;
syg=zeros(1,ndt*length(bity));
if bity(1)==1
    syg(1:ndt)=sin(2*pi*5/4*t);
end

if bity(1)==0
    syg(1:ndt)=sin(2*pi*3/4*t);
end

for i=2:length(bity)
    if round(syg((i-1)*ndt))==0
        if syg((i-1)*ndt-1)<0
            if bity(i)==1
            syg((i-1)*ndt+1:i*ndt)=sin(2*pi*5/4*t);
            else syg((i-1)*ndt+1:i*ndt)=sin(2*pi*3/4*t);
            end
        else
            if bity(i)==1
            syg((i-1)*ndt+1:i*ndt)=-sin(2*pi*5/4*t);
            else syg((i-1)*ndt+1:i*ndt)=-sin(2*pi*3/4*t);
            end
        end
    end
    
    if round(syg((i-1)*ndt))==1
            if bity(i)==1
            syg((i-1)*ndt+1:i*ndt)=cos(2*pi*5/4*t);
            else syg((i-1)*ndt+1:i*ndt)=cos(2*pi*3/4*t);
            end
    end
    
    if round(syg((i-1)*ndt))==-1
            if bity(i)==1
            syg((i-1)*ndt+1:i*ndt)=-cos(2*pi*5/4*t);
            else syg((i-1)*ndt+1:i*ndt)=-cos(2*pi*3/4*t);
            end
    end
    
    
end
%T=0:length(bity)*ndt-1;    //
%T=T/100;                   // przeniesione do main_msk.m
%plot(T,syg);               //
    
end

