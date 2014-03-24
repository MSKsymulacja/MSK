function [] = msk_mod(bity)
%t=[0:0.05:length(bity)];
ndt=100;
t=0:1/ndt:1-1/ndt;
syg=zeros(1,ndt*length(bity));
if bity(1)==0
    syg(1:ndt)=sin(2*pi*4/5*t);
end

if bity(1)==1
    syg(1:ndt)=sin(2*pi*4/3*t);
end

for i=2:length(bity)   
    if round(syg((i-1)*ndt))==0
        if syg((i-1)*ndt-1)<0
            if bity(i)==0
            syg((i-1)*ndt+1:i*ndt)=sin(2*pi*4/5*t);
            else syg((i-1)*ndt+1:i*ndt)=sin(2*pi*4/3*t);
            end
        else
            if bity(i)==0
            syg((i-1)*ndt+1:i*ndt)=-sin(2*pi*4/5*t);
            else syg((i-1)*ndt+1:i*ndt)=-sin(2*pi*4/3*t);
            end
        end
    end
    
    if round(syg((i-1)*ndt))==1
            if bity(i)==0
            syg((i-1)*ndt+1:i*ndt)=cos(2*pi*4/5*t);
            else syg((i-1)*ndt+1:i*ndt)=cos(2*pi*4/3*t);
            end
    end    
    
    if round(syg((i-1)*ndt))==-1
            if bity(i)==0
            syg((i-1)*ndt+1:i*ndt)=-cos(2*pi*4/5*t);
            else syg((i-1)*ndt+1:i*ndt)=-cos(2*pi*4/3*t);
            end
    end  
    
    
end    

plot(syg);
    
end

