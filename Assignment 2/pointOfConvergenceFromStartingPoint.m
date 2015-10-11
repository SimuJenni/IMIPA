function [ pointIndex ] = pointOfConvergenceFromStartingPoint( theta )
%Returns an index indicating the point of convergence of the function 
%g(x,y)=[x^3-3xy^2-1,3x^2y-y^3] given the starting point theta and using
%Newton's Method.
%   The returned index lies in {1,2,3} and corresponds to the solutions
%   [1,0], [-0.5,sqrt(3)/2] and [-0.5,-sqrt(3)/2].
%   If the algorithm doesn't converge, an index of 0 is returned (e.g when
%   theta = [0,0]).

% Want column vectors 
if(isrow(theta))
    theta = theta';
end

% Function handle for g
g = @(x) [x(1)^3-3*x(1)*x(2)^2-1; 3*x(1)^2*x(2)-x(2)^3];

epsilon = 0.01;


while(~hasConverged(theta, epsilon) && norm(theta)~=0) %Stop if theta=[0,0]
    % While not converged do the Newton-Raphson update
    theta = theta-inverseJacobian(theta)*g(theta);
end

[~,pointIndex] = hasConverged(theta, epsilon);

end

function J_inv = inverseJacobian( theta )
%Helper function computing the inverse of the Jacobian J(theta) where 
% J(x,y) = [3x^2-3y^2,   -6xy   ;
%   		   6xy   , 3x^2-3y^2]	
a = 3*theta(1)^2-3*theta(2)^2;
d = a;
b = -6*theta(1)*theta(2);
c = -b;
J_inv = [d, -b; -c, a]/(a*d-b*c);
end

function [isConverged, index] = hasConverged( theta, epsilon )
% Checks the convergence based on the given value and epsilon and returns
% the index of the convergence-point if converged.
if(norm(theta-[1;0])<epsilon)
    isConverged = true;
    index = 1;
    return;
elseif(norm(theta-[-0.5;sqrt(3)/2])<epsilon)
    isConverged = true;
    index = 2;
    return;
elseif(norm(theta-[-0.5;-sqrt(3)/2])<epsilon)
    isConverged = true;
    index = 3;
    return;
else
    isConverged = false;
    index = 0;
end

end