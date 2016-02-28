function [ path ] = pathFromAdjacencyMatrix( AM )
%PATHFROMADJACENCYMATRIX returns the path corresponding to the adjacency
%matrix AM starting from point 1.

n = size(AM,1);

% Check if all elements of AM in {0.1}
if(~sum(sum(AM==0+AM==1))==n^2)
    fprintf('Error: Adjacency-Matrix contains values other than 0 or 1!');
    return;
end

% Check if matrix satisfies constraint that each node has a single 
% successor and a single predecessor
if(~sum((sum(AM,1)==2*ones(1,n)).*(sum(AM,2)==2*ones(n,1))')==n)
    fprintf('Error: Adjacency-Matrix violates constraints!');
    return; 
end

% Retrieve path
path = zeros(1,n);
path(1) = 1;
for i=1:n-1
    neighbor = find(AM(path(i),:));
    if(sum(path==neighbor(1))==0)
        path(i+1) = neighbor(1);
    elseif (sum(path==neighbor(2))==0)
        path(i+1) = neighbor(2);
    else
        fprintf('Error: Non-Hamiltonian cycle!');
    end    
end

end

