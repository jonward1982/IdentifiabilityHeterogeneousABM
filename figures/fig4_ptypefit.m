% Figure 4 - run from figures folder

% Load data
load ../data/data4_ptypefit_N100_tolpow12_dbgamma1_dtuniform.mat

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
N=100;
Ns=10;

%%

figure('Position',[400,400,900,420]); 
ax1=axes('Position',[0.08,0.1600,0.4,0.75]);
ax2=axes('Position',[0.54,0.1600,0.4,0.75]);

plot(ax1,1:Ns,errors(1:Ns),'-o','MarkerSize',ms,...
    'MarkerFaceColor',col,'MarkerEdgeColor','none',...
    'Color',col,'LineWidth',lw);
set(ax1,'Box','on','Layer','top','FontSize',fs);
yL=ylabel(ax1,'Error','FontSize',fl,'Interpreter','latex');
title(ax1,'(a)','FontSize',fl,'Interpreter','latex');
annotation('textbox',[0.1767    0.0    0.2284    0.0924],'String',...
    'Number of types','FitBoxToText','on',...
    'EdgeColor','none','FontSize',fl,'Interpreter','latex');

plot(ax2,1:N,errors(1:N),'-o','MarkerSize',ms,...
    'MarkerFaceColor',col,'MarkerEdgeColor','none',...
    'Color',col,'LineWidth',lw);
set(ax2,'XScale',xscale,'YScale',yscale);
set(ax2,'Box','on','Layer','top','FontSize',fs);
title(ax2,'(b)','FontSize',fl,'Interpreter','latex')
annotation('textbox',[0.6367   0.0    0.2284    0.0924],'String',...
    'Number of types','FitBoxToText','on',...
    'EdgeColor','none','FontSize',fl,'Interpreter','latex');


set(gcf,'PaperPositionMode','auto');
fname=sprintf('figures/fig4_ptypefit_N%d_tolpow%d_db%s_dt%s',...
    p.N,tolpow,dbname,dtname);
print(fname,'-dpng','-r600');
print(fname,'-depsc');