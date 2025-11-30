function [sol,D] = periodicexample(q,N,l,closeto)
    %MAKESPEC Approximates the poinnt spectra of Tu = -u'' + qu using a Numerov method.
    % A more detailed explanation can be found in the function
    % makespecper()
    h = l/N;
    t = h:h:l;
    
    T = zeros([1 N]); T([1 2]) = 12*[2 -1]; T(N) = -12; T = toeplitz(T);
    
    B = zeros([1 N]); B([1 2]) = (h^2)*[10 1]; B(N) = h^2; B = toeplitz(B);
    
    V = diag(q(t));
    
    [sol, D] = eigs(T+B*V - closeto*B, B, floor(sqrt(N)), 'smallestabs');