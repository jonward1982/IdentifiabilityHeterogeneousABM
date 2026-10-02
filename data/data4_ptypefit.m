% Create data for figure 4
%
% Takes about a second to run on 2020 Macbook Air

% Seed random number generator to reproduce paper data.
seed=66157;
rng(seed);

ts=tic;
alpha=0.005;
gamma=1;

p.N=100;
p.alpha=alpha;
p.gamma=gamma;

% Gamma distribution of beta parameters
dbname='gamma1';
p.beta=sort(gamrnd(7,0.8,p.N,1));

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

fname=sprintf('data4_ptypefit_N%d_tolpow%d_db%s_dt%s.mat',...
    p.N,tolpow,dbname,dtname);
save(fname);