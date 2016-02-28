function [ im ] = IM( sigma )
%IM constructs the incidence matrix corresponding to sigma

n = max(size(sigma));
im = zeros(n);

for i=1:n
    im(i,sigma==i) = 1;    
end

end

