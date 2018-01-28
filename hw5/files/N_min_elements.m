function [index, value] = N_min_elements(A, n)
% find nth smallest numbers from each row
A_sorted = zeros(size(A));
A_Index = zeros(size(A));
for i = 1:size(A,1)
    [A_sorted(i,:), A_Index(i,:)] = sort(A(i,:));
end
index = A_Index(:,1:n)';
value = A_sorted(:,1:n)';
end