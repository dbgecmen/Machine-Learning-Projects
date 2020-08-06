clc;
clear all

train = csvread('train.csv');
traingLabel = train(:,1);    train = train(:,2:end);
test = csvread('test.csv');
testLabel = csvread('label.csv');

trainingSet = prdataset(train,traingLabel);

testSet = prdataset(test,testLabel);

A = naivebc(trainingSet);


[V,D] = eig(cov(testSet.data));
PCATraining = trainingSet.data*V(:,1:2);    
PCATest = testSet.data*V(:,1:2);    

PCALabel = zeros(length(trainingSet),2); PCALabel(:,1) = traingLabel==1; PCALabel(:,3) = traingLabel==2;

B = trainingSet*A;
C = testSet*A;
trainError = testc(B);  disp(trainError);
testError = testc(C);   disp(testError);

norm(labeld(trainingSet,A)-traingLabel,1)/length(trainingSet)
norm(labeld(testSet,A)-testLabel,1)/length(testSet)