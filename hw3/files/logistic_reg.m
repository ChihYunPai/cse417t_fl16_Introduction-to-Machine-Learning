function [ w, e_in, num_its, execution_time] = logistic_reg( X, y, w_init, max_its, eta, tolerance )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
%       tolerance: how close to zero you need each element of the gradient to be in order to terminate

%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)
%       e_clss : report classification error after learning
%       num_its : number of iterations time
%       execution_time : execution time of whole logistic regression
%       algorithm
X_ = [ones(size(X,1),1) X];
w = w_init;
tic
%%Compute the gradient
for num_its = 0 : max_its
    g_temp = zeros(size(X_));
    for i = 1 : size(X_,1)
        g_temp(i,:) = y(i).*X_(i,:) / (1 + exp(y(i)*(w'*X_(i,:)')));
    end
    gradient = -mean(g_temp);
    %%Set the direction to move
    v = -gradient';
    %%Update the weights
    w = w + eta*(mean(g_temp)');
    %%Terminate the algorithm if the magnitude of each term in the gradient is below terminate_threshold at any step
    if( all( abs(gradient) < tolerance) )
        break
    end
end
e_in = mean( log( 1 + exp(-y.*(X_*w) ) ) );
execution_time = toc;
%%Return the final weight w and e_in
end