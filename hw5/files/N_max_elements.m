function [index, value] = N_max_elements(A, n)
% find nth smallest numbers from each column
A_sorted = zeros(size(A));
A_Index = zeros(size(A));
for i = 1:size(A,2)
    [A_sorted(:,i), A_Index(:,i)] = sort(A(:,i));
end
index = A_Index(size(A,1):-1:(size(A,1)+1-n),:);
value = A_sorted(size(A,1):-1:(size(A,1)+1-n),:);
end