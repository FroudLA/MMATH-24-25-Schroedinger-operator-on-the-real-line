function [sigma_per, sigma_semiper] =  bandgaps(q,a)
    % The bands of the unperturbed problem are determined by the point
    % spectra of the semiperiodic and periodic eigenvalues u'' + q = \lambda u
    N = 500;
    h = a/N;
    t = -a/2:h:a/2-h;
    
    [T_p,T_m] = makeTforbandgaps(N);
    V = diag(q(t));
    
    B_p_0= zeros([1 N]); B_m_0 = zeros([1 N]);
    B_p_0([1 2 N]) = (h^2)*[10 1 1]; B_m_0([1 2 N]) = (h^2)*[10 1 -1];
    B_p = toeplitz(B_p_0); B_m = toeplitz(B_m_0);
    sigma_per = eigs(-T_p+B_p*V,B_p, 5, 'smallestabs');
    sigma_semiper = eigs(-T_m+B_m*V, B_m, 5, 'smallestabs');

end