% Create data for fifth and sixth panels of figure 7
%
% Takes about 1100 seconds to run on 2020 Macbook Air

% Seed random number generator to reproduce paper data.
seed=449174;
rng(seed);

% Parameters

ts=tic;
alpha=0.005;
gamma=1;
p.alpha=alpha;
p.gamma=gamma;
q.alpha=alpha;
q.gamma=gamma;

% % Beta parameter distribution parameters - gamma distribution
% dbname='gamma';
% atrue=6.9;
% btrue=0.9;
% a=atrue;
% b=btrue;

% Beta parameter distribution parameters - approximate gamma distribution
dbname='gammaestimate';
atrue=7;
btrue=0.8;
a=6.9;
b=0.9;

% Theta parameter distribution parameters - exponential
dtname='exp';

T=20;

TOT=1000000;
M=15;
Nvec=ceil(logspace(1,4,M));

% Initialise save data
all_errors=cell(M,1);
mean_error=zeros(M,1);

% Loop over system sizes
for i=1:M

    p.N=Nvec(i);
    q.N=Nvec(i);
    
    % True beta parameters sampled from gamma distribution
    p.beta=gamrnd(atrue,btrue,p.N,1);
    
    % True theta distributions
    p.theta=rndthetaexp_hetABM(1,p.N);
    
    % Number of realisations
    nreal=ceil(TOT/Nvec(i));

    errors=zeros(nreal,1);

    % Loop over realisations
    for j=1:nreal
        % Sample parameters
        q.beta=gamrnd(a,b,q.N,1);
        q.theta=rndthetaexp_hetABM(1,q.N);
      
        % Compute comparison
        [t,y]=ode45(@(t,y) f_ErrHetNSISa(t,y,p,q),[0 T],zeros(p.N+q.N+3,1));
        % Intermediate data storage
        errors(j)=trapz(t,abs(y(:,end)));
    end
    % Data Storage
    all_errors{i}=errors;
    mean_error(i)=mean(errors);

end
run_time=toc(ts);
fprintf('Runtime: %f seconds\n',run_time);

fname=sprintf('data7c_disterror_M%d_TOT%d_db%s_dt%s.mat',...
    M,TOT,dbname,dtname);
save(fname,'p','q','TOT','M','Nvec','all_errors','mean_error',...
    'a','b','atrue','btrue','run_time','dbname','dtname');
