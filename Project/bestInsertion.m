function [ l, s ] = bestInsertion( D )
%BESTINSERTION Implements the best insertion heuristic to solve the TSP
%defined by the NxN distance matrix D and returns the the value of
%the Loss at the found solution (L) and the corresponding path (sigma).

N = size(D,1);

% Array of random node selection
sel = randperm(N);

% Initial 3 starting nodes
s = sel(1:3);

for i=4:N
    % Point to insert
    k = sel(i);
    % Compute increase in path length for each insertion point
    d = arrayfun(@(x) D(s(x),k)+D(k,s(x+1))-D(s(x),s(x+1)),1:i-2);
    d = [d, D(s(i-1),k)+D(k,s(1))-D(s(i-1),s(1))];
    % Best insertion index
    [~,idx] = min(d);
    % Insert in sigma
    s = [s(1:idx), k, s(idx+1:end)];
end

% Assert we have a valid path
assertValidSigma(s,N);

% Compute path-length
l =  L(D,s);

end

