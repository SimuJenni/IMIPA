function [ p ] = heatBath( dH, T )
%HEATBATH Computes the heat-bath probability p for axepting a move with a
%difference in heat dH at a temperature T.

p = 1/(1+exp(dH/T));

end

