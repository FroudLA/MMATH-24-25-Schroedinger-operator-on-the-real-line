epsilon = .1;


q = @(x) -1./ (x + epsilon); N = 4000; l = 400; closeto = -20;
h = l/N;


[sol,D]=dirichletexample(q, N,l,closeto);
t = h:h:l-h;
D = D  + diag(closeto + 0*t);
err = sol*D - ;
plot(t,sol(:,1:6))
legend(num2str(D(1,1)),num2str(D(2,2)),num2str(D(3,3)),num2str(D(4,4)),num2str(D(5,5)),num2str(D(6,6)))