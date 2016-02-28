function assertValidSigma( sigma, N )
% Asserts that sigma is a valid path of length N (each node visited once...)
assert(length(sigma)==N);
assert(prod(histcounts(sigma,N))==1);
end

