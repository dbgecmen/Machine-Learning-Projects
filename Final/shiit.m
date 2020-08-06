a = load('train.csv');
b = load('test.csv');

% remove labels from training data
train = a(:,2:end);
lab = a(:,1);
% define test set
test = b;
%%

    
    prtrainset = prdataset(train,lab);
    
    %%
    model = svc(prtrainset); 
 
    
