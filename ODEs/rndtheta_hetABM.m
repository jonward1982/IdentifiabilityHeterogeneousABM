function theta=rndtheta_hetABM(N)
% function theta=rndtheta_hetABM(N)
%
% Uniformly random draw of thetas such that sum is one

xi=sort(rand(N-1,1));
theta=[xi; 1]-[0; xi];