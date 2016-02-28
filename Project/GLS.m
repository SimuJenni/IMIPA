function [ best, sigma ] = GLS( D, moveFun )
%GLS Greedy Local Search with moves defined by moveFun to solve the
%TSP defined by the NxN distance matrix D and returns the the values of
%the Loss for the best solution at each move and the best path (sigma).

N = size(D,1);
m = 10*N^2; % number of moves

% Cache for performance plots 
best = zeros(1,m);

%% Initialisation
sigma = randperm(N);    % Initial solution
l = L(D,sigma);

for i=1:m
    [newSigma, dl] = moveFun(sigma, D);
    if dl<0
        sigma = newSigma;
        l = l+dl;
    end
    best(i) = l;
end

% Sanity check
assert(abs(l-L(D,sigma))<0.01);

end

