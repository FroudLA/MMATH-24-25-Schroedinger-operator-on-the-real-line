function [T_per,T_semiper] = makeTforbandgaps(N)
    % copy paste of the periodic finite difference approximation
    % here the matrix is altered to replicate semi-periodic bcs


    entries_per = zeros([1 N]);
    entries_per([1 2 N]) = [-2 1 1];
    
    

    entries_semiper = zeros([1 N]);
    entries_semiper([1 2 N]) = [-2 1 -1];
    
    
    T_per = toeplitz(12*entries_per);
    T_semiper = toeplitz(12*entries_semiper);
    % since we are neglecting the entry at x_N = l/2
    % making u_0 = u(x_0)
    
end