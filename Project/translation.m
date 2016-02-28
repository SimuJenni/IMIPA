function [ newSigma, dL ] = translation( s, D )
%TRANSLATION Implements the translation-move for the TSP defined by D. 
% Returns the translated path and the change in the loss dL.

N = length(s);

% Generate the two indices and neighbours for the translation
i = randperm(length(s),1);
i_suc = i+1 - ~(mod(i+1,N)-1)*N;

inds4j = 1:N;
inds4j([i,i_suc]) = [];  % these are not valid anymore
j = inds4j(randperm(N-2,1));
j_pre = j-1 + ~mod(j-1,N)*N;
j_suc = j+1 - ~(mod(j+1,N)-1)*N;

% Compute translated path
newSigma = s;
if(i_suc<j)
    newSigma(i_suc) = s(j);
    newSigma(i_suc+1:j) = s(i_suc:j_pre);
else
    newSigma(j) = [];
    newSigma(i) = s(j);
    newSigma(i_suc:end+1) = s(i_suc:end);
end

if i_suc==j_pre
    d_new = D(s(i),s(j)) + D(s(i_suc),s(j_suc));
    d_old = D(s(i),s(i_suc)) + D(s(j),s(j_suc));
elseif j_suc==i
    d_new = D(s(j_pre),s(i)) + D(s(j),s(i_suc));
    d_old = D(s(j_pre),s(j)) + D(s(i),s(i_suc));
else
    d_new = D(s(i),s(j))+D(s(j),s(i_suc))+D(s(j_pre),s(j_suc));
    d_old = D(s(i),s(i_suc))+D(s(j_pre),s(j))+D(s(j),s(j_suc));
end
% Compute difference 
dL = d_new - d_old;

% oldL = L(D,s);
% newL = L(D,newSigma);
% dLTrue = newL-oldL;
% if abs(dLTrue-dL)>1
%     disp('aha');
% end

end

