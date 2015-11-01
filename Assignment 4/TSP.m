clear all;

n = 50;

% Generate n random points in square centered at (0,0) and side-length 4.
points = rand(2,n)*4-2;
pointsCell = num2cell(points,1);

% Fisrt compute all the difference vectors
diffs = cellfun(@(x) repmat(x,1,n)-points,pointsCell, 'UniformOutput', false);
% Then take norms to get the distances
dists = cellfun(@(x) arrayfun(@(idx)norm(x(:,idx),2), 1:n),diffs, 'UniformOutput', false);

% Reshape to get the distance matrix
D = reshape(cell2mat(dists), [n n]);

% Generate random permutation sigma
sigma = randperm(n);
permutedPoints = points(:,sigma);

% Calculate length of cycle defined by sigma
l = L(D,sigma);

% Calculate lower- and upper-bounds
lb = LB(D);
ub = UB(D);

% Construct adjacenecy matrix
am = AM(sigma);

% Calculate the length of the cycle defined by the adjacency matrix
h = H(am, D);

% Construct the incidence matrix corresponding to sigma
im = IM(sigma);

% Calculate the length of the cycle defined by IM
g = G(im,D);

% Print out the results to make sure they're all equal
fprintf('L = %f\nH = %f\nG = %f\nLower-Bound = %f\nUpper-Bound = %f\n', l, h, g, lb, ub);
