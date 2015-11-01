function [ am ] = AM( sigma )
%AM computes the adjacency matrix corresponding to the permutation sigma

% Init adjacency matrix
n = max(size(sigma));
am = zeros(n);

% Retrieve indices of predecessors and successors
tmp = circshift(sigma,[0 -1]);
succes = arrayfun(@(idx)(tmp(sigma==idx)),1:n);
tmp = circshift(sigma,[0 1]);
preds = arrayfun(@(idx)(tmp(sigma==idx)),1:n);

% Set entries in AM
for i=1:n
    am(i,succes(i)) = 1;
    am(i,preds(i)) = 1;
end

end

