function [z] = z_transform(x, phi)
% the function transform 1-dimensional data x to N-order degree with transform
% function phi
%   input: 
%         x: n*1 matrix
%         L: n*N matrix
%   output:
%         z: n*N matrix
z = zeros(size(phi));
for i = 1 : size(phi,1)
    z(i,:) = x(i,1)*phi(i,:);
end

end