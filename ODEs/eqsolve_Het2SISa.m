function ys=eqsolve_Het2SISa(a,b,c,theta)
% function ys=eqsolve_Het2SISa(a,b,c,theta)
%
% Solves for equilibria of 2D heterogeneous with two types of b=(b1;b2)

% Coefficients of cubic
p0=a*b(1)^2*theta^2 + a^2*b(1)*theta^2 - a*b(1)^2*theta^3 ...
    - a^2*b(2)*theta^2 - a*b(1)*b(2)*theta^2 + a*b(1)*b(2)*theta^3 + a*b(1)*c*theta^2;
p1=- 2*a^2*b(1)*theta + 2*b(2)*a^2*theta + 3*a*b(1)^2*theta^2 ...
    - 2*a*b(1)^2*theta - 3*a*b(1)*c*theta - 3*b(2)*a*b(1)*theta^2 ...
    + 2*b(2)*a*b(1)*theta + 2*b(2)*a*c*theta + b(1)^2*c*theta^2 ...
    - b(1)*c^2*theta - b(2)*b(1)*c*theta^2 + b(2)*b(1)*c*theta;
p2=a*b(1)^2 + a^2*b(1) - a^2*b(2) + b(1)*c^2 - b(2)*c^2 - a*b(1)*b(2)...
    + 2*a*b(1)*c - 2*a*b(2)*c - b(1)*b(2)*c - 3*a*b(1)^2*theta ...
    - 2*b(1)^2*c*theta + 3*a*b(1)*b(2)*theta + 2*b(1)*b(2)*c*theta;
p3=a*b(1)^2 + b(1)^2*c - a*b(1)*b(2) - b(1)*b(2)*c;

% Solve cubic for roots
y1r=roots([p3,p2,p1,p0]);
y2r=(c*y1r-(a+b(1)*y1r).*(theta-y1r))./(theta-y1r)/b(1);
yr=[y1r,y2r];

% Focus on real non-negative roots
indeq=all(yr<=1 & yr>=0 & imag(yr)==0,2);
y1s=y1r(indeq);
y2s=y2r(indeq);

ys=[y1s,y2s];