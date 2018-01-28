function [y] = Index2y(Index, yTr)
y = zeros(size(Index));
for i = 1:size(y,1)
    for j = 1:size(y,2)
        y(i,j) = yTr(1,Index(i,j));
    end
end
end
