% Here we test the semiperiodic boundary conditions with no potential and
% we get cosine looking graphs as expected


l = 20;
N=400;
h = l/N;
t = -l/2:h:l/2-h;
q = @(x) 0.*x;


[sigma,sigmasemiper] = bandgaps(q,2*pi);
