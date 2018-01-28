function [preds] = knnclassifier(xTr,yTr,xTe,k)
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% yTr = 1xn input matrix of labels
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%
[Index,Distance] = findknn(xTr,xTe,k);
%self-defined function Index2y:   y = Index2y(Index, yTr);
y = zeros(size(Index));
for i = 1:size(y,1)
    for j = 1:size(y,2)
        y(i,j) = yTr(1,Index(i,j));
    end
end
preds = zeros(1,size(xTe,2));

%method 1: classify to type of the highest count of ks labels
for i = 1 : size(y,2)
    yClss = unique(y(:,i));
    count = histc(   y(:,i) , yClss );
    %To call self-defined function // [most_freq_Index, times] = N_max_elements(count, 1);
    n=1;
    A=count;
    A_sorted = zeros(size(A));
    A_Index = zeros(size(A));
    for it = 1:size(A,2)
        [A_sorted(:,it), A_Index(:,it)] = sort(A(:,it));
    end
    most_freq_Index  = A_Index(size(A,1):-1:(size(A,1)+1-n),:);
    %The end of self-defined function
    preds(1,i) = yClss(most_freq_Index);
end

% %method 2: giving weight of 1/d
% yd = zeros(k,1);
% for i = 1 : size(y,2)
%     yClss = unique(y(:,i));
%     for j = 1 : k
%         yd(j,1) = 1 / Distance(j,i);
%     end
%     y(:,i) = y(:,i) + 1;
%     w_sum = accumarray(y(:,i),yd);
%     w_sum_shrink = zeros(size(yClss));
%     w_sum_Index = 1;
%     for m = 1 : size(w_sum,1)
%         if w_sum(m,1)~=0
%             w_sum_shrink(w_sum_Index) = w_sum(m,1);
%             w_sum_Index = w_sum_Index + 1;
%         end
%     end
%    %To call self-defined function // [w_index, w_value] = N_max_elements(w_sum_shrink, 1);
%     n=1;
%     A=w_sum_shrink;
%     A_sorted = zeros(size(A));
%     A_Index = zeros(size(A));
%     for it = 1:size(A,2)
%         [A_sorted(:,it), A_Index(:,it)] = sort(A(:,it));
%     end
%     w_index  = A_Index(size(A,1):-1:(size(A,1)+1-n),:);
%     %w_value = A_sorted(size(A,1):-1:(size(A,1)+1-n),:);
     %The end of self-defined function
%    preds(1,i) = yClss(w_index,1);
% end

% %method 3: giving weight of 1/k
% yd = zeros(k,1);
% for i = 1 : size(y,2)
%     yClss = unique(y(:,i));
%     for j = 1 : k
%         yd(j,1) = 1 / k;
%     end
%     y(:,i) = y(:,i) + 1;
%     w_sum = accumarray(y(:,i),yd);
%     w_sum_shrink = zeros(size(yClss));
%     w_sum_Index = 1;
%     for m = 1 : size(w_sum,1)
%         if w_sum(m,1)~=0
%             w_sum_shrink(w_sum_Index) = w_sum(m,1);
%             w_sum_Index = w_sum_Index + 1;
%         end
%     end
%    [w_index, w_value] = N_max_elements(w_sum_shrink, 1);
%    preds(1,i) = yClss(w_index,1);
% end

% %method 4: giving weight of (1/distance)*inn_w       
% yd = zeros(k,1);
% for i = 1 : size(y,2)
%     yClss = unique(y(:,i));
%     for j = 1 : k
%         [inn_w] = inn_weight(xTr,yTr,xTr(:,Index(j,i)),yTr(:,Index(j,i)),5);
%         yd(j,1) = 1 / Distance(j,i) * inn_w;
%     end
%     y(:,i) = y(:,i) + 1;
%     w_sum = accumarray(y(:,i),yd);
%     w_sum_shrink = zeros(size(yClss));
%     w_sum_Index = 1;
%     for m = 1 : size(w_sum,1)
%         if w_sum(m,1)~=0
%             w_sum_shrink(w_sum_Index) = w_sum(m,1);
%             w_sum_Index = w_sum_Index + 1;
%         end
%     end
%    [w_index, w_value] = N_max_elements(w_sum_shrink, 1);
%    preds(1,i) = yClss(w_index,1);
% end