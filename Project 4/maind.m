close all;

X = importdata('optdigitsubset.txt');
lab0 = zeros(554,1);
lab1 = ones(571,1);
y = [lab0;lab1];

% Xtrain set consits out of 50 zeros images and 50 ones images
% ytrain are the right labels attached to each row in Xtrain
Xtrain = [X(1:50,:) ; X(555:604,:)];
ytrain = [y(1:50,:) ; y(555:604,:)];

% Imported set Xtest with labels ytest
Xtest = X;
ytest = y;


Xtest(1:50,:) = [];
Xtest(555:604,:) = [];
ytest(1:50,:) = [];
ytest(555:604,:) = [];

errortotal = 0;
featuretotal = 0;
thetatotal = 0;
signtotal = 0;
niter = 1;

for ii = flip(1:niter)
    [feature, theta, sign, Error] = stump(Xtrain,ytrain);  

    errortotal = errortotal + Error;
    featuretotal = featuretotal + feature;
    thetatotal = thetatotal + theta;
    signtotal = signtotal + sign;
    disp(ii)
end



if sign == 0
    testvect = Xtest(:,feature) < theta;
    testerror = sum(testvect ~= ytest)/length(ytest);
else 
    testvect = Xtest(:,feature) > theta;
    testerror = sum(testvect ~= ytest)/length(ytest);
end

avgerr = errortotal/niter
avgfeature = featuretotal/niter
avgtheta = thetatotal/niter
avgsign = signtotal/niter



    
        
