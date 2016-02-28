function [ newSigma, dL ] = inversion( s, D ) 
%INVERSION Implements the inversion-move for the TSP defined by D. 
% Returns the inverted path and the change in the loss dL.

N = length(s);

% Generate the two indices and neighbours for the inversion
i = randperm(length(s),1);
inds4j = 1:N;
inds4j(i) = [];  % j~=i
j = inds4j(randperm(N-1,1));

% Want order s.t. i<j -> swap if needed
if i>j
   t = i;
   i = j;
   j = t;
end
i_suc = i+1 - ~(mod(i+1,N)-1)*N;
j_suc = j+1 - ~(mod(j+1,N)-1)*N;

if i_suc==j
    % Retry
    [ newSigma, dL ] = inversion(s,D);
else
    % Invert 
    newSigma = s;
    newSigma(i_suc:j) = s(j:-1:i_suc);
        
    dL = D(s(i),s(j))+D(s(i_suc),s(j_suc))-D(s(i),s(i_suc))-D(s(j),s(j_suc));
end

end

