function dx=f_ErrHetNSISa(t,x,p,q)
% function dx=f_ErrHetNSISa(t,x,p,q)
%
% Returns RHS for mean-field approximation of the well-mixed heterogeneous 
% SISa model of two different numbers of agents, as well as the sums and
% difference between the sums.
%
% p and q should be structures with variables:
% N - number of types
% alpha - ambient infection rate
% beta - transmission infection rate
% gamma - recovery rate
% theta - fraction of type
%
% Heterogeneous parameters should be vectors.

dx=zeros(p.N+q.N+3,1);

% Parameters should be vectorised.
dx(1:p.N)=(p.alpha+p.beta*sum(x(1:p.N))).*(p.theta-x(1:p.N))-p.gamma.*x(1:p.N);
dx(p.N+1:p.N+q.N)=(q.alpha+q.beta*sum(x(p.N+1:p.N+q.N))).*(q.theta-x(p.N+1:p.N+q.N))-q.gamma.*x(p.N+1:p.N+q.N);
dx(p.N+q.N+1)=sum(dx(1:p.N));
dx(p.N+q.N+2)=sum(dx(p.N+1:p.N+q.N));
dx(end)=dx(p.N+q.N+1)-dx(p.N+q.N+2);