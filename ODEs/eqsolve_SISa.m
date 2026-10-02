function ys=eqsolve_SISa(a,b,c)
% function ys=eqsolve_SISa(a,b,c)
%
% Solves for equilibria of homogeneous SISa model

p0=-a./b;
p1=(a+c-b)./b;

ys=(-p1+sqrt(p1.^2-4*p0))/2;