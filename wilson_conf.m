function [down,up ] = wilson_conf(x,pop,alfa)
alfa=1-alfa;
% down
nu1 = 2*x;
nu2 = 2*(pop-x+1);
F   = finv(alfa/2,nu1,nu2);
lb  = (nu1.*F)./(nu2 + nu1.*F);

xeq0 = find(x == 0);
if ~isempty(xeq0)
    lb(xeq0) = 0;
end

% up
nu1 = 2*(x+1);
nu2 = 2*(pop-x);
F   = finv(1-alfa/2,nu1,nu2);
ub = (nu1.*F)./(nu2 + nu1.*F);

xeqn = find(x == pop);
if ~isempty(xeqn)
    ub(xeqn) = 1;
end

up=ub;
down=lb;


end

