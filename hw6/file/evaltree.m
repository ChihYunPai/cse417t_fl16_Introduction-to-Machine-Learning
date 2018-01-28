function [ypredict] = evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%
[d,n] = size(xTe);
ypredict=zeros(1,n);
for i = 1:n
    Index_current = 1;
    while 1
        if Index_current > size(T,2)
            break
        end
        pred = T(1,Index_current);
        IndexOfFeature = T(2,Index_current);
        CutOffValue = T(3,Index_current);
        LeftChild = T(4,Index_current);
        RightChild = T(5,Index_current);
        if IndexOfFeature ==0 || (LeftChild ==0 && RightChild==0)
            break;
        end
        if xTe(IndexOfFeature,i) <= CutOffValue
            Index_current = LeftChild;
        else % xTe(IndexOfFeature,i)> CutOffValue
            Index_current = RightChild;
        end
    end
    ypredict(i) = pred;
end

end
        