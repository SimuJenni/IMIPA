function [ p ] = metropolis( dH, T )
%METROPOLIS Computes the metropolis probability p for axepting a move with 
%a difference in heat dH at a temperature T.

if dH>0
    p = exp(-dH/T);
else
    p = 1;
end

end

