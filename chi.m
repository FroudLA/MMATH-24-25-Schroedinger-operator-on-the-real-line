function chi = chi(x)
chi = zeros(size(x));
len = length(x);
indices = floor(len/2-len/4) + 1:floor(len/2 + len/4);
chi(indices) = 1i*x(indices);

end