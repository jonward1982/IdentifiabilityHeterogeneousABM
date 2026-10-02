% Figure 1

% Data for figure

ntheta=500;
thetav=linspace(0,1,ntheta);

aL=0.01;
bL=[2; 4];
cL=1;

[xpL,xsL,xs1L]=theta2type(aL,bL,cL,thetav);

aR=0.01;
bR=[1.2; 4];
cR=1;

[xpR,xsR,xs1R]=theta2type(aR,bR,cR,thetav);

% Figure properties
lw=3;

fl=24;
fs=16;
fss=12;

lrf=0.65;
lr=[1,lrf,lrf];

% Plot figure
figure('Position',[400,400,900,420]); 
ax1=axes('Position',[0.08,0.1200,0.42,0.8]);
ax2=axes('Position',[0.54,0.1200,0.42,0.8]);

% Left axis
hold(ax1,"on");
plot(ax1,thetav,xs1L,'--','Color',lr,'LineWidth',lw);
plot(ax1,thetav,xsL,'k','LineWidth',lw);
plot(ax1,thetav,0.*thetav+xpL(1),'r','LineWidth',lw)
plot(ax1,thetav,0.*thetav+xpL(2),'b','LineWidth',lw)
axis(ax1,[0 1 0 1]);
legend(ax1,{'Type 1','Total','All 1','All 2'},'FontSize',fss,'Interpreter','latex');
set(ax1,'Box','on','Layer','top');
set(ax1,'FontSize',fs);
tstr=sprintf('$\\beta_1$ = %2.1f, $\\beta_2$ = %1.1f',bL(1),bL(2));
title(ax1,tstr,'FontSize',fl,'Interpreter','latex');
ylabel(ax1,'Fraction of infected','FontSize',fl,'Interpreter','latex');
xlabel(ax1,'$\theta$','FontSize',fl,'Interpreter','latex');

% Right axis
hold(ax2,"on");
plot(ax2,thetav,xs1R,'--','Color',lr,'LineWidth',lw);
plot(ax2,thetav,xsR,'k','LineWidth',lw);
plot(ax2,thetav,0.*thetav+xpR(1),'r','LineWidth',lw)
plot(ax2,thetav,0.*thetav+xpR(2),'b','LineWidth',lw)
axis(ax2,[0 1 0 1]);
legend(ax2,{'Type 1','Total','All 1','All 2'},'FontSize',fss,'Interpreter','latex');
set(ax2,'Box','on','Layer','top');
set(ax2,'FontSize',fs);
tstr=sprintf('$\\beta_1$ = %2.1f, $\\beta_2$ = %1.1f',bR(1),bR(2));
title(ax2,tstr,'FontSize',fl,'Interpreter','latex');
xlabel(ax2,'$\theta$','FontSize',fl,'Interpreter','latex');

set(gcf,'PaperPositionMode','auto');
print('./figures/fig1_theta2type','-dpng','-r600');
print('./figures/fig1_theta2type','-depsc');