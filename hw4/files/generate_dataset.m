function [ train_set, test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair

%symbolic way to calculate normalizer
%q = sym('q');
%normalizer = sqrt(double(symsum(1/(2*q+1), q, 0, Q_f)));

%numerical for loop method to calculate normalizer
normalizer = 0;
for q = 0 : Q_f
    normalizer = 1/(2*q+1);
end
normalizer = sqrt(normalizer);
% generating train_set
X_train = 2*rand(N_train,1) - 1;
[ L_train ] = computeLegPoly( X_train, Q_f );
a = normrnd(0,1,Q_f+1,1)/normalizer;
epsilon_train = normrnd(0,1,N_train,1);
Y_train = L_train*a + sigma*epsilon_train;

% generating test_set
X_test = 2*rand(N_test,1) - 1;
[ L_test ] = computeLegPoly( X_test, Q_f );
epsilon_test = normrnd(0,1,N_test,1);
Y_test = L_test*a + sigma*epsilon_test;

train_set = [X_train Y_train];
test_set = [X_test Y_test];
end

