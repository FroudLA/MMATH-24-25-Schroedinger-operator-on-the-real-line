function [sol,D] = makesoldir(q,N,l,closeto)
    %MAKESPEC Approximates the poinnt spectra of Tu = -u'' + qu using a Numerov method.
    % A more detailed explanation can be found in the function
    % makespecper()
    h = l/N;
    t = -l/2+h:h:l/2-h;
    
    T = zeros([1 N-1]); T([1 2]) = 12*[2 -1]; T = toeplitz(T);
    
    B = zeros([1 N-1]); B([1 2]) = (h^2)*[10 1]; B = toeplitz(B);
    
    V = diag(q(t));
    
    [sol, D] = eigs(T+B*V - closeto*B, B, floor(sqrt(N)), 'smallestabs');

end