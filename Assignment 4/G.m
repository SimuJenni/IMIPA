function [ g ] = G( IM, D )
%G calculates the length of a cycle defined by the incidence matrix IM and
%distance matrix D.

X = IM*circshift(IM,[0,1])';

g = sum(D(X==1));

end

