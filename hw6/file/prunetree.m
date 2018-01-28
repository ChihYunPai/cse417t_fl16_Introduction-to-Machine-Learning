function T=prunetree(T,xTe,yTe)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here

% Tree
% 1. prediction at this node
% 2. index of feature to cut
% 3. cutoff value c (<=c : left, and >c : right)
% 4. index of left subtree (0 = leaf)
% 5. index of right subtree (0 = leaf)
% 6. parent (0 = root)
leafIndex = find(T(4, :) == 0 & T(5, :) == 0 & T(6, :)~=0);
oddIdx   = find(mod(leafIndex,2) == 0);
leafIndex = leafIndex(oddIdx);

for i = 1:length(leafIndex)
	node = leafIndex(i);
	root = T(6, node);
	oldAcc = analyze('acc',yTe,evaltree(T,xTe));
	if root ~= 0,
		newT = T;
		newT(4:5, root) = 0;
		newT(:, root*2:root*2+1) = zeros(6, 2);
		newAcc = analyze('acc',yTe,evaltree(newT,xTe));
		if newAcc >= oldAcc,
			T = newT;
		end
	end

end

end

