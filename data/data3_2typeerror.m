% Create data for figure 3
%
% Takes about 45 seconds to run on 2020 Macbook Air

% Seed random number generator to reproduce paper data.
seed=635645;
rng(seed);

ts=tic;

% Data for 2-type error

% Parameters
alpha=0.005;
gamma=1;
p.alpha=alpha;
p.gamma=gamma;
q.alpha=alpha;
q.gamma=gamma;

% True values
N=100;
p.N=N;

% Beta parameter distribution parameters - gamma distribution
dbname='gamma';
a=7;
b=0.8;
% Truth case infection rates
p.beta=sort(gamrnd(a,b,p.N,1));

% Theta parameter distribution parameters - uniform
dtname='uniform';
p.theta=rndtheta_hetABM(p.N);

% Need to solve for y
ysall=get_eq(p,1E4,1E-6);
ys=sum(ysall);

% Approximate with 2 types
q.N=2;

% Solve time
T=20;

% Triangular meshpoints
% Start with square grid
nx=50;
ny=50;
[X,Y]=meshgrid(linspace(0,1,nx),linspace(0,1,ny));
x=X(:);
y=Y(:);
% Triangulation of rectangular grid
DT=delaunayTriangulation(x,y);
% Centres of triangles
IC=incenter(DT);
% Map to allowable space
A=zeros(2);
A(1,1)=(alpha+gamma)*(1-ys)/gamma;
A(2,1)=(alpha+gamma)*ys/gamma-alpha/gamma;
A(1,2)=alpha*(1-ys)/gamma;
A(2,2)=A(2,1);

z=IC*A;
thetav=z(:,1);
y1v=z(:,2);
np=length(thetav);

% Errors
errors=zeros(np,1);

% Count bad values
count=0;

for i=1:np
    % Set parameter values
    theta1=thetav(i);
    theta2=1-thetav(i);
    
    y1=y1v(i);
    y2=ys-y1;
    beta1=(gamma*y1./(theta1-y1)-alpha)/ys;
    beta2=(gamma*y2./(theta2-y2)-alpha)/ys;
    if beta1>0 && beta2>0
        
        q.theta=[theta1; theta2];
        q.beta=[beta1; beta2];
        
        y0=zeros(p.N+q.N+3,1);
        [t,y]=ode45(@(t,y) f_ErrHetNSISa(t,y,p,q),[0 T],y0);
    
        er=trapz(t,abs(y(:,end)));
        errors(i)=er;
    
    else

        count=count+1;

    end

end

if count>0
    fprintf('Number of errors: %d\n',count);
end

%%
% Algorithm choice

q=get_params_sum_theta(p,q.N,ysall);

% Map to unit square
ys2a=eqsolve_Het2SISa(alpha,q.beta,gamma,q.theta(1));

xya=[q.theta(1), ys2a(1)]/A;
xa=xya(1);
ya=xya(2);

% Compute error
[t,y]=ode45(@(t,y) f_ErrHetNSISa(t,y,p,q),[0 T],y0);
era=trapz(t,abs(y(:,end)));

%%
% Minimum error value
[ermin,idmin]=min(errors);

run_time=toc(ts);
fprintf('Runtime: %f seconds\n',run_time);

%%
% Save data
fname=sprintf('data3_2typeerror_np%d.mat',np);
save(fname);
