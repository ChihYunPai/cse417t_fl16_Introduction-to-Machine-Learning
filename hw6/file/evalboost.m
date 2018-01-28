function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
[~,n]= size(xTe);
nt = size(BDT,2);
prediction = zeros(nt,n);
for i = 1:nt
   prediction(i,:) = evaltree(BDT{i},xTe);
end
preds = mode(prediction,1);
end


