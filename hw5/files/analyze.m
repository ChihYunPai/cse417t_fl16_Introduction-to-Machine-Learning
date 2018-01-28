function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 
switch kind
	case 'abs'  % compute the absolute difference between truth and predictions
		output = sum(truth~=preds);
	case 'acc'  % compute the accuracy of predictions over truth
        output = sum(truth==preds) / size(preds,2);
end
		 	
end