function [ w iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
iterations = 0;
N = size(data_in, 1);
d = size(data_in,2)-2;
x = data_in(:,1:d+1);
y = data_in(:,end)';
y_training = zeros(1,N);
w = zeros(1,d+1);
w(1) = 0;
%%
while ~all(y==y_training)
    for i = 1:N
        if(y(i)~=sign(w*x(i,:)'))
            iterations = iterations + 1;
            w = w + y(i) * x(i, :);
        end
        y_training = sign(w*x');
        if(sum(y==y_training)==N)
            break
        end
    end
end

end

