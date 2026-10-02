% Figure 3

% Data
load ../data/data3_2typeerror_np4802.mat

% Figure properties
lw=3;

fl=24;
fs=16;
fss=12;

% Figure
figure; 

patch('Faces',DT.ConnectivityList,...
    'Vertices',DT.Points,'FaceVertexCData',errors,...
    'FaceColor','flat','EdgeColor','none');
hold on;
plot(IC(idmin,1),IC(idmin,2),'wv','MarkerFaceColor','w');
plot(xa,ya,'wo','MarkerFaceColor','w');
set(gca,'FontSize',fs);

cb=colorbar;
cb.Label.String='Error';
cb.Label.FontSize=fl;
cb.Label.Interpreter='latex';

xlabel('$\hat{\theta}_1$','FontSize',fl,'Interpreter','latex');
ylabel('$\hat{y}_1$','FontSize',fl,'Interpreter','latex','Rotation',0)

set(gca,'Box','on','Layer','top');

set(gcf,'PaperPositionMode','auto');
print('./figures/fig3_2typeerror','-dpng','-r600');
print('./figures/fig3_2typeerror','-depsc');

