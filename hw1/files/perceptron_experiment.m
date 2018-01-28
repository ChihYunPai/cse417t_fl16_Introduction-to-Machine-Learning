function [ num_iters bound_minus_ni] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)
num_iters = zeros(1,num_samples);
for i = 1:num_samples
    x = 2*rand(N,d+1)-1;
    x(:,1) = 1;
    w_st = rand(1,d+1);
    w_st(1) = 0;
    y = sign(w_st * x');
    data = [x, y'];
    [ w_result, num_iters(i) ] = perceptron_learn( data );
end
x_temp = zeros(1,N);
for i = 1:N
    x_temp(i) = sum(x(i,2:end).^2);
end
R_square = max(x_temp);
w_norm = norm(w_st.^2);
P = min(y.*(w_st*x'));

bound = R_square * w_norm^2 / (P^2);
bound_minus_ni =  bound - num_iters;

figure(1)
histogram(num_iters)
title('hostogram of each experiment iterations')
xlabel('iterations times')
ylabel('numbers')
legend('number of iterations')

figure(2)
histogram(log(bound_minus_ni))
title('hostogram of log(bound - number of iterations)')
xlabel('log(bound - number of iterations)')
ylabel('numbers of log(bound - number of iterations)')
legend('numbers of log(bound - number of iterations)')
end
