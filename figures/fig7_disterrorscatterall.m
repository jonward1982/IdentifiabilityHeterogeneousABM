% Figure 7

% Plotting parameters
fs=12;
fl=18;
ms=12;
lw=3;
col=[0 0 0.5];
al=0.02; 

%%

figure('Position',[323,1,800,976]); 
ax5=axes('Position',[0.09,0.050,0.4,0.27]);
ax6=axes('Position',[0.58,0.050,0.4,0.27]);
ax3=axes('Position',[0.09,0.375,0.4,0.27]);
ax4=axes('Position',[0.58,0.375,0.4,0.27]);
ax1=axes('Position',[0.09,0.700,0.4,0.27]);
ax2=axes('Position',[0.58,0.700,0.4,0.27]);

%%

load ../data/data7a_disterror_M15_TOT1000000_dbgamma_dtexp.mat
plot_distscatter(ax1,ax2,Nvec,mean_error,all_errors,p,q,ms,col,lw,fs,fl,al,'(a)','(b)','log',[10,10^4,5E-3,2]);

load ../data/data7b_disterror_M15_TOT1000000_dbgamma_dtnormANDexp.mat
plot_distscatter(ax3,ax4,Nvec,mean_error,all_errors,p,q,ms,col,lw,fs,fl,al,'(c)','(d)','log',[10,10^4,5E-3,2]);

load ../data/data7c_disterror_M15_TOT1000000_dbgammaestimate_dtexp.mat
plot_distscatter(ax5,ax6,Nvec,mean_error,all_errors,p,q,ms,col,lw,fs,fl,al,'(e)','(f)','linear',[10,10^4,0,1.5]);

xL=xlabel(ax5,'Number of types','FontSize',fl,'Interpreter','latex'); %,... 
xR=xlabel(ax6,'$\theta_p$','FontSize',fl,'Interpreter','latex'); %,... 

%%

set(gcf,'PaperPositionMode','auto');
fname='figures/fig7_disterrorscatterall';
print(fname,'-dpng','-r600');
print(fname,'-depsc');