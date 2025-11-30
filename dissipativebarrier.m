% Lewis Froud MMATH 2024 Perturbed Spectrum on Finite Intervals With
% Periodic and dirichlet BCs

% With use of a Numerov Finite difference method and MATLAB's built in
% eigenvalue approximation tool ~eig(), this program returns a numerical
% approximation of the lower end of the point spectrum for a perturbed
% schrodinger (where the unperturbed potential q is assumed to be 2pi-periodic) operator
% using ~bandgaps() to return an approximation of the band gaps.

run('ubddsol')

epsilon = 40;
N = 6000;
l = 2*z(54);
barr = 72;
q = @(x) cos(x);
r = @(x) -epsilon./(1+x.^2);
chi = @(x)(1i/4)*(1 + tanh(x + barr)) .* (1 + tanh(-((x - barr))));
q_r_chi = @(x) q(x) + r(x)+ chi(x);

sigma_dir = makespecdir(q_r_chi,N,l);

% sigma_per = makespecper(q_r,N,l);

% The aim of this plot is to get a side by side comparison of
% approximations of the spectrum on a variety of increasing domains

[bandstart, bandend] = bandgaps(q, 2*pi);
x = 20; y = 20; width = 500*1.618; height = 500; header = ['Stepsize: ', num2str(l/N), ',  interval length: $l = $', num2str(l), ', dissipative barrier cutoff: $\pm$', num2str(barr), '.'];

figure('Position',[x y width height])
axis([-4 3 -.1 1.1])
hold on;
scatter(real(sigma_dir), imag(sigma_dir),'marker', '.')
title(header,'interpreter','latex')
hold on;
scatter( [bandstart(1:4); bandend(1:4)],[0 0 0 0 0 0 0 0]','marker','x');
scatter(  [bandstart(1:4);bandend(1:4)],[1 1 1 1 1 1 1 1]','marker','x');

legend({'$spec(T_l)$','Start/end points of $spec_e(T)$','Start/end points of $spec_e(T)$ shifted up to $i{\mathbb R}$'},interpreter='latex')