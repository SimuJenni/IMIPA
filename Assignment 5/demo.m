% clear all;

% Choose p = dim(theta)
p = 20; % should be even

% Define function to be minimized.
B = diag(ones(p,1)*0.5)+0.5;
L = @(x) (sum(x(1:round(length(x)/2)).^4) + x*B*x');

theta = nelder_mead(L, p);