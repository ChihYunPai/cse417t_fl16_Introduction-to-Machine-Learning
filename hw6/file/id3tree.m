function T = id3tree(xTr, yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%
[d,n] = size(xTr);
if nargin < 4
    weights = ones(1,n)./n;
end
if nargin < 3
    maxdepth = 1 + ceil(log2(n));
end

T = zeros(6,2^maxdepth-1);
H = zeros(2^maxdepth-1,n);
H(1,:) = ones(1,n);
treeIndex = zeros(1,2^maxdepth-1);
treeIndex(1) = 1;

for i =1:(2^(maxdepth-1)-1)
   if treeIndex(i) ~=0
       y = yTr(H(i,:)==1);
       x = xTr(:,H(i,:)==1);
       if (size(unique(y),2)==1)
           T(1,i)=y(1);
           continue;
       elseif any(any(diff(x,1,2))) ==0
           T(1,i) = mode(y);
           continue;
       else
           [feature, cut, ~] = entropysplit(xTr, yTr, weights .* H(i,:));
           T(1:5,i) = [mode(y);feature;cut;2*i;2*i+1];
           T(6,[2*i,2*i+1]) = i;
           treeIndex([2*i,2*i+1]) = 1;
           H(2*i,:) = H(i,:) .*(xTr(feature,:) <= cut);
           H(2*i+1,:) = H(i,:) .* (xTr(feature,:) > cut);
       end
   end
end
for i = 2^(maxdepth-1):(2^maxdepth-1)
    if treeIndex(i) ==1
        y = yTr(H(i,:)==1);
        T(1,i) = mode(y);
    end
end

end