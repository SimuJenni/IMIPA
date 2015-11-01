function [ ub ] = UB( D )
%UB calculates an upper-bound to the true loss L(D) by using the half-sum
%of the longest two edges adjacent to each node.

% Sort columns of D and extract last and 2nd last rows (two longest adj edges)
longestDists = sort(D,1);
longestEdges = longestDists(end-1:end,:);

% Calculate lowerbound
ub = 0.5*sum(longestEdges(:));
end

