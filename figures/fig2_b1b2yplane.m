% Figure 2

% Plot (b1,b2) plane total infected

% Parameters
a=0.01;
c=1;
theta=0.3;

% (b1,b2) plane parameters
n1=100;
n2=101;

b1=linspace(0.01,8,n1);
b2=linspace(0.01,8,n2);

[B2,B1]=meshgrid(b2,b1);

Y2s=zeros(n1,n2);

% Solve for total infected at each point
for i=1:n1
    for j=1:n2
        ys=eqsolve_Het2SISa(a,[b1(i),b2(j)],c,theta);
        Y2s(i,j)=sum(ys);
    end
end

% Figure parameters
fs=16;
fl=24;
ms=15;
lw=3;
col=[0 0 0.5];

% Figure
figure('Position',[400,400,900,420]); 
ax1=axes('Position',[0.06,0.1100,0.4,0.8150]);
ax2=axes('Position',[0.48,0.1100,0.4,0.8150]);

nl=25;

contour(ax1,B1,B2,Y2s,linspace(0,1,nl),'LineWidth',lw); 
xlabel(ax1,'$\beta_1$','FontSize',fl,'Interpreter','latex');
ylabel(ax1,'$\beta_2$ ','FontSize',fl,'Interpreter','latex','Rotation',0);
title(ax1,'(a) Two-type equilibrium','FontSize',fl,'Interpreter','latex');

BB=B1*theta+B2*(1-theta);
Y1s=eqsolve_SISa(a,BB,c);

contour(ax2,B1,B2,Y1s,linspace(0,1,nl),'LineWidth',lw); 
xlabel(ax2,'$\beta_1$','FontSize',fl,'Interpreter','latex');
title(ax2,'(b) MF infection rate','FontSize',fl,'Interpreter','latex');

cb=colorbar('Position',[0.9,0.1095,0.0178,0.8143]);
cb.Label.String='Total infected fraction';
cb.Label.FontSize=fl;
cb.Label.Interpreter='latex';
cb.Label.Position=[3,0.4483,0];

set(gcf,'PaperPositionMode','auto');
print('./figures/fig2_b1b2yplane','-dpng','-r600');
print('./figures/fig2_b1b2yplane','-depsc');