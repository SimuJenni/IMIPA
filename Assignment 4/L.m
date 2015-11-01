function [ length ] = L( D, sigma )
%Computes the length of a cycle according to the distance matrix D and the
%cycle defined by the permutation sigma.
%   D is an nxn distance matrix and sigma a permution of the numbers
%   {1,...n}. 

% Indices corresponding to used edges
indices = num2cell([sigma; sigma(2:end), sigma(1)],1);

% Retrieve relevant distances
dists = cellfun(@(x)D(x(1),x(2)),indices, 'UniformOutput', false);

% And sum up
length = sum([dists{:}]);
end

