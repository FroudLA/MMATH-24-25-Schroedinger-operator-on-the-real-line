% Lewis Froud MMATH 2024 Perturbed Spectrum on Finite Intervals With
% Periodic and dirichlet BCs

% With use of a Numerov Finite difference method and MATLAB's built in
% eigenvalue approximation tool ~eig(), this program returns a numerical
% approximation of the lower end of the point spectrum for a perturbed
% schrodinger (where the unperturbed potential q is assumed to be 2pi-periodic) operator
% using ~bandgaps() to return an approximation of the band gaps.

run('ubddsol')


epsilon = 40;
N_1 = 3000;N_11= 3500; N_2 = 4000; N_22 = 5000; N_3 = 8000;
l_1 = 2*z(18); l_11 = 2*z(27); l_2 = 2*z(36); l_22 = 2*z(45); l_3 = 2*z(54);
q = @(x) cos(x);
r = @(x) -epsilon./(1+x.^2);

q_r = @(x) q(x) + r(x);


sigma_dir_1 = makespecdir(q_r,N_1,l_1);
sigma_dir_11 = makespecdir(q_r,N_11,l_11);
sigma_dir_2 = makespecdir(q_r,N_2,l_2);
sigma_dir_22 = makespecdir(q_r,N_22,l_22);
sigma_dir_3 = makespecdir(q_r,N_3,l_3);

% sigma_per = makespecper(q_r,N,l);

% The aim of this plot is to get a side by side comparison of
% approximations of the spectrum on a variety of increasing domains


[bandstart, bandend] = bandgaps(q, 2*pi);
x = 20; y = 20; width = 600; height = 600; header = '$Spec(T_n)$ with Dirichlet BCs and Iterval Lengths:';
subheader = [ '$l_1 =  ', num2str(l_1),'$, $l_2 = ',num2str(l_11),'$, $l_3 = ',num2str(l_2),'$, $l_4 = ',num2str(l_22),'$, $l_5 = ', num2str(l_3),  '$.'];

figure('Position',[x y width height])
hold on;
axis([-.1 4.1 -2 3])
scatter([zeros([length(sigma_dir_1) 1]);ones([length(sigma_dir_11) 1]);2*ones([length(sigma_dir_2) 1]);3*ones([length(sigma_dir_22) 1]); 4*ones([length(sigma_dir_3) 1])], [sigma_dir_1; sigma_dir_11; sigma_dir_2; sigma_dir_22;sigma_dir_3], '.')
title(header,'interpreter','latex')
subtitle(subheader,'Interpreter','latex')
ax = gca;
xax = ax.XAxis;
xax.TickValues = []; xax.Visible = 'off';
hold on;
plot([-0.1,4.1],[bandstart,bandstart],'color', '#469990')
plot([-0.1,4.1],[bandend,bandend],'color', '#469990')
plot([-0.1,4.1], [0 0], 'r--')