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
v1 = zeros(1,N);
vrand = zeros(1,N);
vmin = zeros(1,N);
V = zeros(1000,N);
epsilon = 0: 0.1: 0.5;
e       = 0:0.001: 0.5;
P_count = zeros(1,6);
v1_count = 0:1:10;
vrand_count = 0:1:10;
vmin_count = 0:1:10;

for n = 1:N
    V(:,n) = sum(randi([0 1],1000,10),2)/10;
    v1(1,n) = V(1,n); %the first of V
    ri = randi([1 1000]);
    vrand(1,n) = V(ri,n); %randomly choose V(ri)
    vmin(1,n) = min(V(:,n));
end
%% Section (b)
% Plotting v1, vrand and vmin distribution as histograms.
fraction = 0:0.001:1;
discrete = 0:0.1:1;

Hb = zeros(1,1001);
for i = 1:1001
Hb(i) = exp(-2*( (abs(0.5-fraction(i))^2 )*10));
end

figure
%histogram combination
%histogram(v1, discrete);
%hold on
%histogram(vrand, discrete);
%hold on
%histogram(vin, discrete);
%hold on
%plot(fraction, Hb, 'b-')
%title('(b.4) combination of Hb, v1, vrand and vmin')
%xlabel('fraction of heads')
%ylabel('probability')
%legend('Hb')

figure
histogram(v1)
title('(b.1) histograms of the distributions of v1')
xlabel('experiment times')
ylabel('fraction of heads')
legend('v1')

figure
histogram(vrand)
title('(b.2) histograms of the distributions of vrand')
xlabel('experiment times')
ylabel('fraction of heads')
legend('vrand')

figure
histogram(vmin)
title('(b.3) histograms of the distributions of vmin')
xlabel('experiment times')
ylabel('fraction of heads')
legend('vmin')

%figure
%histogram(v1, vrand, vmin)
%title('(b.4) conbimation of histograms of the distributions of v1, vrand, vmin and Heofdding bound')
%xlabel('experiment times')
%ylabel('fraction of heads')
%legend('vmin')

%% Section (c)
% Plotting estimates for Probability f(epsilon) , together with Hoeffding bound.
for i = 1:6
   P_count(i) = sum( abs(V(:)-0.5) > epsilon(i) ) / (N*1000);
end
for i = 1:501
    Hoeffding_bound(i)  = exp(-2*(e(i)^2)*10);
end
figure
plot( epsilon, P_count, 'g*', e, Hoeffding_bound, '-.b')
title('(c) estimates probability and Heoffding bound graph')
xlabel('\epsilon')
ylabel('probability')
legend('estimates probability', 'Hoeffding bound')
end