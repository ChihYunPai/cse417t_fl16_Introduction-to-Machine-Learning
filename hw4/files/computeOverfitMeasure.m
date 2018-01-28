function [ overfit_mean, overfit_median ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_mean: differences between error of H_10(mean(g_10)) and error of H_2(mean(g_2))
%       overfit_median: median of a vector of length num_expts, which vector reporting each of the
%                  differences in error between H_10 and H_2
%train_set(:,1)  :  x_train
%train_set(:,2)  :  y_train
%test_set(:,1)   :  x_test
%test_set(:,2)   :  y_test
Eout = @(h,y) mean((h-y).^2);
Eout_g2 = zeros(num_expts,1);
Eout_g10 = zeros(num_expts,1);
for i = 1 : num_expts
    [ train_set, test_set ] = generate_dataset( true_Q_f, N_train, N_test, sqrt(var) );
    w_2         = glmfit(computeLegPoly(train_set(:,1),2), train_set(:,2), 'normal', 'constant', 'off');
    w_10        = glmfit(computeLegPoly(train_set(:,1),10), train_set(:,2), 'normal', 'constant', 'off');
    g_2         = computeLegPoly(test_set(:,1),2)*w_2;
    g_10        = computeLegPoly(test_set(:,1),10)*w_10;
    Eout_g2(i)  = Eout(g_2, test_set(:,2));
    Eout_g10(i) = Eout(g_10, test_set(:,2));
end
overfit_mean = mean(Eout_g10) - mean(Eout_g2);
overfit_median = median(Eout_g10 - Eout_g2);
end

