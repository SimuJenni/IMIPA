function [ l, sigma ] = saving( D )
%SAVING Implements the saving construction heuristic to solve the
%TSP defined by the NxN distance matrix D and returns the the value of
%the Loss at the found solution (L) and the corresponding path (sigma).

N = size(D,1);

% initial warehouse node
w = randperm(N,1);

% Construct initial tours of N-1 agents
nodes2visit = 1:N;
nodes2visit(w) = [];    % exclude warehouse
tours = num2cell(nodes2visit(randperm(N-1)));

% Precompute the savings for all pairs (only once!)
pairs = combnk(1:length(tours),2);
S = zeros(N-1,N-1,4);
for i=1:size(pairs,1)
    a = pairs(i,1);
    b = pairs(i,2);
    S(a,b,:) = mergeSavings(tours{a}, tours{b},D,w); 
    S(b,a,:) = S(a,b,:);
end

for c =1:length(tours)-1
    
    % Get pair (a,b) with the most savings
    [v, I] = max(S(:));
    [a,b,idx]=ind2sub(size(S),I);
    
    assert(a~=b);
    
    % Merge
    switch idx
        case 1
            tours{a} = [tours{a}, tours{b}];
        case 2
            tours{a} = [fliplr(tours{a}), tours{b}];
        case 3
            tours{a} = [tours{b}, tours{a}];
        case 4
            tours{a} = [tours{a}, fliplr(tours{b})];
        otherwise
            disp('Noooo?')
    end

    % Update savings for tour a
    for i=1:size(S,1)
        if a==i
            continue;
        end
        S(a,i,:) = mergeSavings(tours{a}, tours{i},D,w);
        S(i,a,:) = S(a,i,:);
    end
    
    % Delete the merged tour b
    S(b,:,:) = [];
    S(:,b,:) = [];
    tours(b) = [];
end

sigma = [w tours{1}];
l = L(D,sigma);

end

function S = mergeSavings(a,b,D,w)
S1 = D(a(end),w)+D(w,b(1))-D(a(end),b(1));
S2 = D(a(1),w)+D(w,b(1))-D(a(1),b(1));
S3 = D(b(end),w)+D(w,a(1))-D(b(end),a(1));
S4 = D(a(end),w)+D(w,b(end))-D(a(end),b(end));
S = [S1, S2, S3, S4];
end

