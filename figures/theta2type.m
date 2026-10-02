function [xp,xs,xs1]=theta2type(a,b,c,theta)
% function [xp,xs,xs1]=theta2type(a,b,c,theta)
%
% For SISa model with 2-types, compute equlibriubum fraction of infected of
% type 1 (xs1) and total (xs) at range of theta values given parameters a,
% b (should have 2 entries), c.

ntheta=length(theta);

% Get 1-type equilibria for both b values
C1=(b-a-c)./b;
C2=4*a./b;
xp=(C1+sqrt((C1.^2+C2)))/2;

% Output data
xs=zeros(ntheta,1);
xs1=zeros(ntheta,1);

% Set end points
xs(1)=xp(2);
xs(end)=xp(1);
xs1(1)=0;
xs1(end)=xp(1);

% Loop through theta values
for i=2:ntheta-1
    % Get equilibrium
    ys=eqsolve_Het2SISa(a,b,c,theta(i));
    if size(ys,1)>1
        sprintf('Multiple equilibria')
        break
    end
    xs(i)=sum(ys);
    xs1(i)=ys(1);
end