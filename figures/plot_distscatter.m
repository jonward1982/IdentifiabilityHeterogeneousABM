function plot_distscatter(ax1,ax2,Nvec,mean_error,all_errors,p,q,ms,col,lw,fs,fl,al,llab,rlab,yscale,alim1)
% function plot_distscatter(ax1,ax2,Nvec,mean_error,errors,p,q,ms,col,lw,fs,fl,al,llab,rlab,yscale,alim1)

ecol=[0.7 0.7 1];

hold(ax1,'on');

% Error bars
M=length(Nvec);
for i=1:M

    errors=all_errors{i};
    prc=prctile(errors,[5,95]);

    plot(ax1,Nvec(i)*[1,1],prc,'Color',ecol,'LineWidth',2);

end

plot(ax1,Nvec,mean_error,'-o','MarkerSize',ms,...
    'MarkerFaceColor',col,'MarkerEdgeColor','none',...
    'Color',col,'LineWidth',lw);
axis(ax1,alim1);
set(ax1,'Box','on','Layer','top','FontSize',fs,'XScale','log','YScale',yscale);
% xL=xlabel(ax1,'Number of types $P$','FontSize',fl,'Interpreter','latex'); %,... 
    % 'Position',[316.2288,0.016,1]);
yL=ylabel(ax1,'Error','FontSize',fl,'Interpreter','latex');
title(ax1,llab,'FontSize',fl,'Interpreter','latex');

hold(ax2,'on');
st=scatter(ax2,p.theta,p.beta,'b','Filled','MarkerFaceAlpha',al); 
sa=scatter(ax2,q.theta,q.beta,'r','Filled','MarkerFaceAlpha',al);
set(ax2,'Box','on','Layer','top','FontSize',fs);
% xR=xlabel(ax2,'$\theta_p$','FontSize',fl,'Interpreter','latex'); %,... 
    % 'Position',[316.2288,0.016,1]);
yR=ylabel(ax2,'$\beta_p$ ','FontSize',fl,'Interpreter','latex','Rotation',0);
title(ax2,rlab,'FontSize',fl,'Interpreter','latex');

% Create copy of scatter objects for legend
stc=copyobj(st,ax2);
stc.XData = nan(size(stc.XData)); 
stc.MarkerFaceAlpha=0.5;
stc.DisplayName='True';
sac=copyobj(sa,ax2);
sac.XData = nan(size(sac.XData));
sac.MarkerFaceAlpha=0.5;
sac.DisplayName='Model';
legend(ax2,[stc,sac],'FontSize',fl,'Interpreter','latex');