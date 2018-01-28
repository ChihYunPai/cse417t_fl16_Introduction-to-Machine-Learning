function BDT=boosttree(X,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data X with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree

%% fill in code here
if nargin < 3
    nt = 100;
end

if nargin < 4
    maxdepth = 3;
end

[d,n] = size(X);

w = ones(1,n)./n; % Initialization of weights
BDT_temp = cell(1,nt);
T = id3tree(X,y,maxdepth,w); 
BDT_temp{1}=T;

for i = 2:1:nt
    BDT_temp{i} = id3tree(X,y,maxdepth,w); % Find the best weak learner for current weighting
    h = evaltree(BDT_temp{i},X);
    h = (h-1.5).*2;
    y = (y-1.5).*2;
    err = sum(w(y~=h)); % Weighted error of h
    if err > .5 % If worse than random, then stop
        break;
    end
    alpha = .5*log((1-err)/err); % Compute learning rate
    w = w.*exp(-alpha.*h.*y)./(2*sqrt(err*(1-err))); % Compute new normalized weights
    y = .5.*y + 1.5;
end

BDT = cell(1,i);
for k=1:i
    BDT{k} = BDT_temp{k};
end
