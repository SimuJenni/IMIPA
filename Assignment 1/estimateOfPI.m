function [ estimate ] = estimateOfPI( numOfTrials )
%RETURNS AN ESTIMATE OF PI
%    Estimated using the probaility of a uniformly chosen point on the unit
%   square lying in the quarter circle with radius 1 and center (0,0).

positions = rand(numOfTrials,2);
dist2origin = sqrt(sum(positions.^2,2));
estimate = mean(dist2origin<=1)*4;
end

