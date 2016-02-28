function [ D ] = distanceMatrix( X )
%DISTANCEMATRIX Computes the distance matrix correspending to the TSP
%defined by the 2xN matrix X of point coordinates.

% Number of points
n = size(X,2);
pointsCell = num2cell(X,1);

% Fisrt compute all the difference vectors
diffs = cellfun(@(x) repmat(x,1,n)-X,pointsCell,'UniformOutput', false);

% Then take norms to get the distances
dists = cellfun(@(x) arrayfun(@(idx)norm(x(:,idx),2), 1:n),diffs,...
    'UniformOutput', false);

% Reshape to get the distance matrix
D = reshape(cell2mat(dists), [n n]);

end

