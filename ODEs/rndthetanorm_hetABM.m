function theta=rndthetanorm_hetABM(sigma,N)
% function theta=rndthetanorm_hetABM(sigma,N)
%
% Sample thetas from exponential then scale such that sum is one

xi=abs(1+sigma*randn(N,1))/N;
theta=xi/sum(xi);