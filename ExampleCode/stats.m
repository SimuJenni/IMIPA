function [totalsum,average] = stats (input_vector)
% STATS - Calculates cumulative total & average
totalsum = sum(input_vector);
average = ourmean(input_vector);		%Call to subfunction

function y = ourmean (x)
% OURMEAN - Calculates average
[m,n] = size(x);
if m == 1
   m = n;
end
y = sum(x)/m;