a = load('train.csv');
b = load('test.csv');



[trainset,validationset] = gendat(a,0.8);

trainset1 = trainset(:,2:end);
trainsetlab1 = trainset(:,1);
    
validationset1 = validationset(:,2:end);
validationsetlab1 = validationset(:,1);
    
prtrainset = prdataset(trainset1, trainsetlab1);

[W,FRAC] = PCAM(,N) 
predvallab = labeld(validationset1,W);
valerror = sum(predvallab ~= validationsetlab1)/length(validationsetlab1);
disp(valerror)
