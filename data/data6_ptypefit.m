% Create data for figure 6
%
% Takes about about 50 seconds to run on 2020 Macbook Air

% Seed random number generator to reproduce paper data.
seed=808246;
rng(seed);

ts=tic;
alpha=0.005;
gamma=1;

p.N=1000;
p.alpha=alpha;
p.gamma=gamma;

% Four peak distribution of beta parameters
dbname='4peaks';
ngroups=4;
groupsize=p.N/ngroups;
betagroups=zeros(groupsize,ngroups);
betagroups(:,1)=sort(gamrnd(0.5,0.5,groupsize,1));
mus=[3,6,9];
for i=1:3
    rn=mus(i)+0.5*randn(p.N,1);
    rn=rn(rn>0);
    betagroups(:,i+1)=sort(rn(1:groupsize));
end
p.beta=betagroups(:);

% Theta distribution
dtname='uniform';
p.theta=rndtheta_hetABM(p.N);

%%

T=20;

tolpow=12;
tol=10^(-tolpow);
ys=get_eq(p,1E6,tol);

errors=zeros(p.N,1);
for i=1:p.N
    q=get_params_sum_theta(p,i,ys);

    y0=zeros(p.N+q.N+3,1);
    [t,y]=ode45(@(t,y) f_ErrHetNSISa(t,y,p,q),[0 T],y0);

    errors(i)=trapz(t,abs(y(:,end)));
end
run_time=toc(ts);

fprintf('Runtime: %f seconds\n',run_time);

fname=sprintf('data6_ptypefit_N%d_tolpow%d_db%s_dt%s.mat',...
    p.N,tolpow,dbname,dtname);
save(fname);