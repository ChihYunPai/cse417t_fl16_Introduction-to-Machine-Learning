function [ test_error] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   This function takes as inputs the weight vector representing a linear
%   separator (w), the test examples in matrix form with each row
%   representing an example (X), and the labels for the test data as a
%   column vector (y). X does not have a column of 1s as input, so that 
%   should be added. The labels are assumed to be plus or minus one. 
%   The function returns the error on the test examples as a fraction. The
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )
probability_threshold = 0.5;
X_ = [ones(size(X,1),1) X];
%% (1) h = theta(X_*w) / (2) h = sign( X_*w) 
%(1) h_logistic = theta(X_*w)
logistic_function = 1 ./ (1 + exp(-X_*w));
h_logistic = (logistic_function >= probability_threshold) - ((logistic_function >= probability_threshold)==0);
test_error_logistic = mean( y ~= h_logistic );
%(2) h_linclss = sign( X_*w)
%h_linclss = sign( X_*w);
%test_error_linclss = mean( y ~= h_linclss );

test_error = test_error_logistic;
end

