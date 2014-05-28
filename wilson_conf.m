function [ ] = wilson_conf()

wyniki=randi(21,1,50)-1;
n=length(wyniki);
p=0.95;

hist(wyniki,20)

end

