function sigma = makespecper(q,N,l)
    
    % for the numerov approximation, we construct three matrices T, B and V
    % except for V which is diagional with entries V_ii = q(x_i), T which
    % approximates the Laplacian and B which is used to apply the Numerov
    % method should be altered to test for different boundary conditions.
    h = l/N;
    t = -l/2:h:l/2-h;
    T = zeros([1 N]);
    T([1 2 N]) = 12*[2 -1 -1];
    T = toeplitz(T);
    
    B = zeros([1 N]);
    B([1 2 N]) = (h^2)*[10 1 1];
    B = toeplitz(B);
    
    V = diag(q(t));
    
    sigma = eigs(T + B*V, B, N/2, 'smallestabs');
    
end