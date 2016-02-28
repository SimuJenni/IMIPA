function [ l, sigma ] = shortestEdge( D )
%SHORTESTEDGE Implements the shortest-edge insertion heuristic to solve the
%TSP defined by the NxN distance matrix D and returns the the value of
%the Loss at the found solution (L) and the corresponding path (sigma).

N = size(D,1);

% First construct an array of edges
edges = struct;
idx = 1;
for row=1:N-1
    for col=row+1:N
        edges(idx).nodes = [row,col];
        edges(idx).dist = D(row,col);
        idx = idx+1;
    end 
end

% Sort according to distance
[dists, order] = sort([edges(:).dist],'ascend');
edges = edges(order);

% Get unique distances
uniqueDist = unique(dists);
for i=1:length(uniqueDist)
    indEqDists = find(dists==uniqueDist(i));
    % Randomly permute edges with equal lengths
    edges(indEqDists) = edges(indEqDists(randperm(length(indEqDists))));
end

assert(sum(abs([edges(:).dist]-dists))<0.0001);

% Store path information in adjacency matrix
AM = zeros(N);
nodeEdgeCount = zeros(1,N);     % Array counting the edges per node
idx = 1;
for i=1:N
    valid = false;
    while(~valid)
        if(idx>length(edges))
            disp('Ooops! No valid edge was found... :/') 
            break;
        end
        % Next shortest edge
        edge = edges(idx);
        valid = checkConstraints(edge, nodeEdgeCount, i-1, AM);
        idx = idx+1;
    end
    
    % Increase edge count for chosen edge
    nodeEdgeCount(edge.nodes) = nodeEdgeCount(edge.nodes)+1;
    
    % Add entries in adjacency matrix
    AM(edge.nodes(1),edge.nodes(2)) = 1;
    AM(edge.nodes(2),edge.nodes(1)) = 1;
end

sigma = pathFromAdjacencyMatrix(AM);

% Assert we have a valid path
assertValidSigma(sigma,N);

% Compute path-length
l =  L(D,sigma);
end

function valid = checkConstraints(edge, edgeCount, edgeNum, AM)

% Node degree <=2 ?
if(edgeCount(edge.nodes(1))==2 || edgeCount(edge.nodes(2))==2)
    valid = false;
    return;
end

% Check if edge could introduce cycle
couldCycle = edgeCount(edge.nodes(1))==1 && edgeCount(edge.nodes(2))==1;
hasCycle = false;
if couldCycle
    % Add edge in adjacency matrix
    AM(edge.nodes(1),edge.nodes(2)) = 1;
    AM(edge.nodes(2),edge.nodes(1)) = 1;
    % Check if cycle was created 
    path = [];
    path(1) = edge.nodes(1);
    for i=1:edgeNum
        neighbor = find(AM(path(i),:));
        if(length(neighbor)<2)
            hasCycle = false;
            break;
        elseif(~ismember(neighbor(1),path))
            path(i+1) = neighbor(1);
        elseif (~ismember(neighbor(2),path))
            path(i+1) = neighbor(2);
        else
            hasCycle = true;
            break;
        end    
    end
end

% Done if all edges found
done = edgeNum+1==length(edgeCount);

valid = ~hasCycle || done || edgeNum==0;

end

