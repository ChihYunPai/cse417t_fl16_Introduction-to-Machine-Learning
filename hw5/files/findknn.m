function [Index,Distance]=findknn(xTr,xTe,k)
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors

% this line equavalant to the rest of the coding
%[Index, Distance] = N_min_elements(l2distance(xTe,xTr),k);

A=l2distance(xTe,xTr);
% find nth smallest numbers from each row
A_sorted = zeros(size(A));
A_Index = zeros(size(A));
for i = 1:size(A,1)
    [A_sorted(i,:), A_Index(i,:)] = sort(A(i,:));
end
Index = A_Index(:,1:k)';
Distance = A_sorted(:,1:k)';
end