clear all;
clc;
train = csvread('train.csv');  
test = csvread('test.csv');

trainLabel = train(:,1);    
train = train(:,2:end);
varNoise = (mean(var(test))-mean(var(train)));
params = 2:4;
total = zeros(size(params));
for k = 1:length(params)
for i = 1:400
%noise = (rand(20,204)-0.5)*2*r;
noise = sqrt(varNoise)*randn(20,204);
permuation = randperm(200);
trainingSet = prdataset(train(permuation(1:180),:),trainLabel(permuation(1:180)));
testSet = prdataset(train(permuation(181:end),:)+noise,trainLabel(permuation(181:end)));

%A = randomforestc(trainingSet,500,204);
%A = fisherm(trainingSet);
%A = naivebc(trainingSet,params(k));
%A = qdc(trainingSet,params(k));

B = trainingSet*A;
C = testSet*A;
trainError = testc(B);  
testError = testc(C);  
total(k) = total(k)+testError;
end
total(k) = total(k)/400;
end
disp(total)