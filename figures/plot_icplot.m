% Plot information criterion plot - used by figures 5 and 6

% Plotting parameters
fs=16;
fl=24;
ms=10;
lw=3;
col=[0 0 0.5];
scale='log';
% scale='linear';
xscale=scale;
yscale=scale;

% Number of points to plot - must be less than p.N
Ns=10;

Nv=[1:Ns]';

figure('Position',[400,400,900,420]); 
ax1=axes('Position',[0.08,0.1600,0.4,0.75]);
ax2=axes('Position',[0.58,0.1600,0.4,0.75]);
plot(ax1,Nv,log(errors(Nv))+Nv,'-o','MarkerSize',ms,...
    'MarkerFaceColor',col,'MarkerEdgeColor','none',...
    'Color',col,'LineWidth',lw);
xlim(ax1,[1,Ns]);
set(ax1,'Box','on','Layer','top','FontSize',fs);
xL=xlabel(ax1,'Number of types','FontSize',fl,'Interpreter','latex');
yL=ylabel(ax1,'Information Criterion','FontSize',fl,'Interpreter','latex');
title(ax1,'(a)','FontSize',fl,'Interpreter','latex');

nbars=20;
histogram(ax2,p.beta,nbars,'FaceColor',col,'FaceAlpha',1,...
    'Normalization','probability');
set(ax2,'Box','on','Layer','top','FontSize',fs);
xR=xlabel(ax2,'$\beta_p$','FontSize',fl,'Interpreter','latex'); 
yR=ylabel(ax2,'Fraction','FontSize',fl,'Interpreter','latex');
title(ax2,'(b)','FontSize',fl,'Interpreter','latex');

set(gcf,'PaperPositionMode','auto');
fname=sprintf('figures/fig5_icplot_N%d_tolpow%d_db%s_dt%s',...
    p.N,tolpow,dbname,dtname);
print(fname,'-dpng','-r600');
print(fname,'-depsc');
