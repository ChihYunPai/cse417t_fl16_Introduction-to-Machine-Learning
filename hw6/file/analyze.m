function output=analyze(kind,truth,preds)		
%
% Analyses the average accuracy/error for a test set
% Input:
% kind='acc' classification accuracy
% kind='abs' absolute loss
% kind='zero_one' 0/1 loss 
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the avg absolute difference between truth and predictions
		output=sum(abs(truth-preds))/length(truth);
    case 'zero_one'
		% compute the avg 0/1 loss between truth and predictions
		output=sum(truth~=preds)/length(truth);   
	case 'acc' 
		% compute the avg accuracy between truth and predictions
		  if (isempty(truth) && isempty(preds)) 
		  	output=0;
		  else
		  	output=sum(truth==preds)/length(truth);
		  end;
end;

