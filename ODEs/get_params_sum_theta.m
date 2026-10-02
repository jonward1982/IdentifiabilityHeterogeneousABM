function q=get_params_sum_theta(p,N,ys)
% function q=get_params_sum_theta(p,N,ys)

q.N=N;
q.alpha=p.alpha;
idb=kmeans(p.beta,q.N);
zi=zeros(q.N,1);
q.beta=zeros(q.N,1);
q.theta=zeros(q.N,1);
for i=1:q.N
    zi(i)=sum(ys(idb==i));
    q.theta(i)=sum(p.theta(idb==i));
end
q.beta=(p.gamma*zi./(q.theta-zi)-p.alpha)./sum(zi);
q.gamma=p.gamma;

% Should check that parameters ok