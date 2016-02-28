function [ newSigma, dL ] = mixedMove( s, D )
%MIXEDMOVE Performs either a swap-, translation- or inversion-move for the
%TSP defined by D with a probability of 1/3 each.

p = rand;
if p<1/3
    [ newSigma, dL ] = swap( s, D );
elseif p<2/3
    [ newSigma, dL ] = translation( s, D );
else
    [ newSigma, dL ] = inversion( s, D );
end

end

