function Ex1_10
%% Exercise 1.10
% The experiment flipping 1000 fair coins independently 10 times. Repeating
% experiment for a large number of times (e.g., 100,000). v1, vrand and
% vmin are the fraction of heads of coin c1, crnad, and cmin respectively.
% Where c1: the first coin flipped; crand: a coin randomly choose; cmin the
% coin that had the minumum frequency of heads.

%% Section (b)
% Repeating the experiment of flipping coin for 100,000 times.
N = 100000;
v1 = zeros(N,1);
vrand = zeros(N,1);
vmin = zeros(N,1);
epsilon = 0: 0.1: 0.5;
e       = 0:0.0001: 0.5;
P_count = zeros(1,6);
Hoeffding_bound = zeros(1,501);
V = zeros(1000,N);
for n = 1:N
    V(:,n) = sum(randi([0 1],1000,10),2)/10;
    v1(n) = V(1,n); %the first of V
    vrand(n) = V(randi([1 N], 1, 1), n); %randomly choose V(k)
    vmin(n) = min(V(:,n));
end

%% Section (c)
% Plotting estimates for Probability f(epsilon) , together with Hoeffding bound.
for i = 1:6
   P_count(i) = sum( abs(V(:)-0.5) > epsilon(i) ) / N;
end
for i = 1:501
    Hoeffding_bound  = 2*exp(-2*(e(i)^2)*N);
end
plot(epsilon, P_count, 'b*', e, Hoeffding_bound, 'g-');

end