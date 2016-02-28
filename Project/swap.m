function [ newSigma, dL ] = swap( s, D )
%SWAP Implements the swap-move for the TSP defined by D. 
% Returns the swapped path and the change in the loss dL.

N = length(s);

% Swap two entries in sigma
inds = randperm(length(s),2);
i = inds(1);    j = inds(2);
newSigma = s;
newSigma(inds) = s(fliplr(inds));

% Compute predecessor and successor indices
i_pre = i-1 + ~mod(i-1,N)*N;
j_pre = j-1 + ~mod(j-1,N)*N;
i_suc = i+1 - ~(mod(i+1,N)-1)*N;
j_suc = j+1 - ~(mod(j+1,N)-1)*N;

if i_suc==j
    d_new = D(s(i_pre),s(j)) + D(s(i),s(j_suc));
    d_old = D(s(i_pre),s(i)) + D(s(j),s(j_suc));
elseif j_suc==i
    d_new = D(s(j_pre),s(i)) + D(s(j),s(i_suc));
    d_old = D(s(j_pre),s(j)) + D(s(i),s(i_suc));
else
    d_new = D(s(i_pre),s(j))+D(s(j),s(i_suc))+D(s(j_pre),s(i))+D(s(i),s(j_suc));
    d_old = D(s(i_pre),s(i))+D(s(i),s(i_suc))+D(s(j_pre),s(j))+D(s(j),s(j_suc));
end
% Compute difference 
dL = d_new - d_old;

% oldL = L(D,s);
% newL = L(D,newSigma);
% dLTrue = newL-oldL;
% if abs(dLTrue-dL)>0.1
%     disp('aha');
% end

end

