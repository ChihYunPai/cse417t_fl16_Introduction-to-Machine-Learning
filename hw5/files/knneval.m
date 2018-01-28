function [result_,totaltime_] = knneval()
% k: input for choose k
result_=[];
totaltime_=[];
fprintf('Face Recognition: (1-nn)\n')
load('faces');
tic;
preds=knnclassifier(xTr,yTr,xTe,1);
result=analyze('acc',yTe,preds);
totaltime=toc;
fprintf('You obtained %2.2f%% classification acccuracy in %2.4f seconds\n',result*100.0,totaltime);
result_=[result_ result];
totaltime_ = [totaltime_ totaltime];
fprintf('\n');

% %shuffling (both training set and testing set) 10 times to make sure the prediction accuracy is consistent
%     for i = 1:10
%     %Randomly shuffling training set, training label, test set and test label
%     idx_shf = randperm(size(xTr,2));
%     xTr = xTr(:,idx_shf);
%     yTr = yTr(:,idx_shf);
%     idx_shf = randperm(size(xTe,2));
%     xTe = xTe(:,idx_shf);
%     yTe = yTe(:,idx_shf);
%     tic;
%     preds=knnclassifier(xTr,yTr,xTe,1);
%     result=analyze('acc',yTe,preds);
%     totaltime=toc;
%     fprintf('You obtained %2.2f%% classification(after shufflying) acccuracy in %2.1f seconds\n',result*100.0,totaltime);
%     result_=[result_ result];
%     totaltime_ = [totaltime_ totaltime];
% end

fprintf('Handwritten digits Recognition: (5-nn)\n')
load('digits');
tic;
preds=knnclassifier(xTr,yTr,xTe,5);
result=analyze('acc',yTe,preds);
totaltime=toc;
fprintf('You obtained %2.2f%% classification acccuracy in %2.1f seconds\n',result*100.0,totaltime);
result_=[result_ result];
totaltime_ = [totaltime_ totaltime];

% %shuffling (both training set and testing set) 10 times to make sure the prediction accuracy is consistent
% for i = 1:10
%     %Randomly shuffling training set, training label, test set and test label
%     idx_shf = randperm(size(xTr,2));
%     xTr = xTr(:,idx_shf);
%     yTr = yTr(:,idx_shf);
%     idx_shf = randperm(size(xTe,2));
%     xTe = xTe(:,idx_shf);
%     yTe = yTe(:,idx_shf);
%     tic;
%     preds=knnclassifier(xTr,yTr,xTe,1);
%     result=analyze('acc',yTe,preds);
%     totaltime=toc;
%     fprintf('You obtained %2.2f%% classification(after shufflying) acccuracy in %2.1f seconds\n',result*100.0,totaltime);
%     result_=[result_ result];
%     totaltime_ = [totaltime_ totaltime];
% end