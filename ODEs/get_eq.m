function ys=get_eq(p,T,tol)
% function ys=get_eq(p,T,tol)
% 
% Get equilibrium solution to heterogeneous SISa via numerical simulation.

opts=odeset('AbsTol',0.1*tol,'RelTol',0.1*tol,'Events',@(t,y) event_neareq(t,y,p,tol));
[~,y,ts,ys,is]=ode45(@(t,y) f_HetNSISa(t,y,p),[0 T],zeros(p.N,1),opts);

if length(is)==0
    fprintf('Equlibrium not found.');
end