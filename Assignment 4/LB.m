function [ lb ] = LB( D )
%LB calculates a lower-bound on the true loss L(D) by calculating the
%half-sum of the shortest two edges adjacent to each node.

% Sort columns of D and extract 2nd and 3rd rows (two shortest adj edges)
sortedDists = sort(D,1);
shortestEdges = sortedDists(2:3,:);

% Calculate lowerbound
lb = 0.5*sum(shortestEdges(:));
end


