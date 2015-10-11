function [avg, stdev, r] = ourstats(x,tol)
% OURSTATS finds the "average", "standard dev.", and "rank"
% for vectors "avg" is the mean value
% for matrices "avg" is a row-vector

[m,n] = size(x);
if m == 1
	m = n;
end
avg = sum(x)/m;
stdev = sqrt(sum(x.^2)/m - avg.^2);

s = svd(x);
r = sum(s > tol);