function F=forest(X,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees
%
% OUTPUT:
% F | Forest
%

%% fill in code here
[~,n] = size(X);
if nargin <3
    nt = 20;
end
F = cell(nt, 1);

for i = 1 : nt
    Index = randi(n, 1, n);
    T = id3tree(X(:, Index), y(1, Index), 4);
    F{i} = T;
end
end
