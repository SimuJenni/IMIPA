function [ xMin, xMax, xMean, xStd ] = evaluateEstimator( N, numEstimates )
%Evaluates the PI estimator by computing the min, max, mean and standard
%deviation of numEstimates estimations with N trials.

c = cell(numEstimates, 1);
c(:) = {N};
estimates = cellfun(@estimateOfPI, c);
xMin = min(estimates);
xMax = max(estimates);
xMean = mean(estimates);
xStd = std(estimates);

end

