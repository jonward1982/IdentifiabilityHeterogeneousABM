function dx=f_HetNSISa(t,x,p)
% function dx=f_HetNSISa(t,x,p)
%
% Returns RHS for mean-field approximation of the 
% well-mixed heterogeneous SISa model
%
% p should be a structure with variables:
% alpha - ambient infection rate
% beta - transmission infection rate
% gamma - recovery rate
% theta - fraction of type
%
% Heterogeneous parameters should be vectors.

% Parameters should be vectorised.
dx=(p.alpha+p.beta*sum(x)).*(p.theta-x)-p.gamma.*x;