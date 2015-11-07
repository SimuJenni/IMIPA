function [ h ] = H( AM, D )
%H calculates the length of a cycle defined by adjacency matrix AM 
%with the distance matrix D.

n = size(AM,1);
h = 0;
for idx=1:n
    h = h+sum(D(idx,find(AM(idx,idx+1:end)==1)+idx));
end

% h = sum(sum(AM.*D)); apperently would be better :D

end

