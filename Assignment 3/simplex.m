function [ x ] = simplex( d, A, b )
%Solves the LP argmin<d,x> s.t. Ax<=b, x_i>=0 using the simplex-method.
% Returns nil if the problem is infeasible

% Check inputs (want column-vectors...)
if(isrow(b))
   b = b'; 
end
if(isrow(d))
    d = d';
end

[m,n]=size(A);
% Initialize x
x = zeros(m+n,1);
% Transform inequalities into equalities by introducing slack variables
x(n+1:end) = b;

% Initialize the index-vector
sigma = 1:m+n;

while(true)
    % Check stopping criterion
    if(sum(d<0)<=0)
        % Set x to optimal value
        x(sigma(1:n)) = 0;
        x(sigma(n+1:n+m)) = b(1:m);
        break;
    end

    % Select pivot-column
    [~,s] = min(d);

    % Check feasibility
    if(sum(A(:,s)>0)<=0)
        % infeasible
        x = nil;
        break;
    end

    % Select pivot-row
    tmp = b./A(:,s);
    tmp(~(A(:,s)>0)) = realmax;
    [~,r] = min(tmp);

    % Update variables
    Anew = A;
    idxr = [1:r-1;r+1:m]; idxc = [1:s-1;s+1:n]; 
    Anew(idxr,idxc) = A(idxr,idxc)-(A(idxr,s)*A(r,idxc))/A(r,s);
    Anew(idxr,s) = -A(idxr,s)/A(r,s);
    Anew(r,idxc) = A(r,idxc)/A(r,s);
    Anew(r,s) = 1/A(r,s);
    bnew = b;
    bnew(idxr) = b(idxr)-b(r)*A(idxr,s)/A(r,s);
    bnew(r) = b(r)/A(r,s);
    dnew = d;
    dnew(idxc) = d(idxc)-d(s)*A(r,idxc)/A(r,s);
    dnew(s) = -d(s)/A(r,s);
    A = Anew; b = bnew; d = dnew;

    % Exchange in sigma
    tmp = sigma(s);
    sigma(s) = sigma(n+r);
    sigma(n+r) = tmp;
end


end

