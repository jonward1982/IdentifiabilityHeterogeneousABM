function [value,isterminal,direction] = event_neareq(t,y,p,tol)
% function [value,isterminal,direction] = event_neareq(t,y,p,tol)
%
% Trigger event when HetSISa is sufficiently close (within tol) to
% equilibrium (using total number of infected)

value=sum(f_HetNSISa(t,y,p))-tol;
isterminal=1;
direction=0;