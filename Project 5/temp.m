%Train test
for i =1:100
load('apple');
load('banana');


numelements = round(0.70*length(apple));
indices = randperm(length(apple));
% indices = indices(1:numelements);
   
trainset_apple = apple(indices(1:numelements));
trainset_banana = banana(indices(1:numelements));

testset_apple = apple(indices(numelements+1:end));
testset_banana = banana(indices(numelements+1:end));


[dataset_train,labelref_train] = gendatmilsival(trainset_apple,trainset_banana);
[dataset_test,labelref_test] = gendatmilsival(testset_apple,testset_banana);


Train = dataset_train*fisherc;  %train classifier
Test = dataset_test*Train;          %apply classifier on training set
instancelabels = labeld(dataset_test,Train);
bagid_test = getident(dataset_test,'milbag');


labelbag = combineinstlabels(bagid_test,instancelabels);

apple_error(i) = norm(1-labelbag(1:18),1)/(length(labelbag)/2);

banana_error(i) = norm(labelbag(19:end)-2,1)/(length(labelbag)/2);
end

