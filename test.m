l = 20;
N=600;
h = l/N;
t_dir = -l/2+h:h:l/2-h;
q = @(x) x.^2;



[sol,D] = makesoldir(q,N,l,6);
