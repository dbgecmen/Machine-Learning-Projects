clear all;
clc;
train = csvread('train.csv');   test = csvread('test.csv');
trainLabel = train(:,1);    train = train(:,2:end);

p = 1:6;
r = 0.1:0.1:6;

error = zeros(length(p),length(r));
iter = 10;
sigma = 100;
for i = 1:length(p)
    disp(i);
    for j = 1:length(r)
        for k = 1:20
            permTrain = randperm(200);
            permTest = randperm(20000); permTest = permTest(1:1000);
            trainNoise = train(permTrain(1:100),:) + randBall(p(i),r(i),204,100);
            trainValidation = train(permTrain(101:end),:) + randBall(p(i),r(i),204,100) ;
            predictedLabels = labelprop([trainNoise;test(permTest,:);trainValidation],[trainLabel(permTrain(1:100));zeros(1100,1)],sigma,'euclidean',2,iter);
            error(i,j) = error(i,j) + norm(trainLabel(permTrain(1:100))-predictedLabels(1101:end),1);
        end
    end
end
error = error/(100);

[MP,IP] = min(error,[],1);
[Mr,Ir] = min(MP);
pOpt = p(IP(Ir));
rOpt = r(Ir);