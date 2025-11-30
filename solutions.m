% Lewis Froud MMATH Project 2025
% We use a finite difference approximation to calcuulate eigenvalues in the gaps of essential spectrum


epsilon = 40;
N = 8000;
l = 200*pi; 
q = @(x) cos(x);
r = @(x) -epsilon./(1+x.^2);
q_r = @(x) q(x) + r(x);
t = -l/2+l/N:l/N:l/2-l/N;


[sol, D] = makesoldir(q_r,N,l,0.5);


header = "Eigenvectors Who's Eigenvalues Lie Close to 0.5";
subheader = ['in the Band Gap Between ',num2str(bandend(1)),' and ', num2str(bandend(2)), '.'];
header1 = ['$\lambda = $',num2str(D(3,3)+0.5)];
header2 = ['$\lambda = $',num2str(D(1,1)+0.5)];
header3 = ['$\lambda = $',num2str(D(2,2)+0.5)];

tiles = tiledlayout(3,1);
nexttile;
plot(t,sol(:,3))
title(header1,'interpreter','latex')
nexttile;
plot(t,sol(:,1))
title(header2,'interpreter','latex')
nexttile;
plot(t,sol(:,2))
title(header3,'interpreter','latex')

title(tiles, header,'interpreter','latex')
subtitle(tiles, subheader,'interpreter','latex')