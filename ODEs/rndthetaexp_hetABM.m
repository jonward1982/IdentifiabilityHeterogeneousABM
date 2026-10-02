function theta=rndthetaexp_hetABM(mu,N)
% function theta=rndthetaexp_hetABM(mu,N)
%
% Sample thetas from exponential then scale such that sum is one

xi=exprnd(mu,N,1);
theta=xi/sum(xi);