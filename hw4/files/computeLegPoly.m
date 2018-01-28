function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated atthe corresponding x value in the input
L = zeros(size(x,1),Q+1);
L(:,1) = 1;
L(:,2) = x;
for k = 2:Q
    L(:,k+1) = ((2*k-1) * L(:,k) .* x - (k-1) * L(:,k-1) ) / k;
end
z = L;
end