a = load('train.csv');
b = load('test.csv');

% remove labels from training data
train = a(:,2:end);


% define test set
test = b;
%%
%varNoise = (mean(var(test))-mean(var(train)));


  

    p=2;
    r=1;
    n=204;
    lengthtrain = size(train,1);
    result = [];

    for ii=1:100
        for i = 1:lengthtrain
        
        % create noise to add to the train set
        eps = gamrnd(1/p,p,[n,1]);
        eta = eps.^(1/p);

        s=randn(n,1);
        s=(s./abs(s));
        x=s.*eta;

        w=rand(n,1);
        z=w.^(1/n);

        y=r*z.*(x./norm(x,p));
        
        % noise matrix 200 X 204
        result(i,:)=y';
        end
    
     
        
    % add noise to the training set
    noisytrain = train + result;
    
    % add labels back to noisy training data
   
    noisytrain = [a(:,1), noisytrain];
    
    
    
    % split noised training set in 80% training and 20% validation
    [train1,validationset] = gendat(noisytrain,0.8);
    
   
    
    trainset1 = train1(:,2:end);
    trainsetlab1 = train1(:,1);
    
   
    trainset1=[trainset1;test(1:1000,:)];
    trainsetlab1 = [trainsetlab1;zeros(1000,1)];
    
    validationset1 = validationset(:,2:end);
    validationsetlab1 = validationset(:,1);
    
    
    

    prtrainset = prdataset(trainset1, trainsetlab1);
    model = svc(prtrainset,(proxm('p',1)),1); 
    predvallab = labeld(valset1,model);
    valerror(ii) = sum(predvallab ~= validationsetlab1)/length(validationsetlab1);
    disp(valerror(ii));
    
    %validationsetlab1 = validationset(:,1);
   % vallabpred=newlabels2(1161:end,:);
    
   
    %valerror(ii) = sum(vallabpred ~= validationsetlab1)/length(validationsetlab1);
    end

1-mean(valerror)

