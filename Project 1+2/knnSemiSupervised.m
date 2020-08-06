% clear all
% clc

X = load('magic.txt');
Y = X(:,11);
X = X(:,1:10);
X = X./std(X);
N = length(Y);
%%% Second Assignment %%%
k = 1;
numberTest = 5000;
nLabeled = 25;
nUnlabeled = [10 20 40 80 160 320 640];
errorSemiSupervised = zeros(size(nUnlabeled));
errorSupervised = errorSemiSupervised;
TotalErrorSemiSupervised = errorSemiSupervised;
TotalErrorSupervised = errorSemiSupervised;
logProbability = zeros(size(nUnlabeled));
logProbabilitySupervised = zeros(size(nUnlabeled));
logProbabilityTotal = zeros(size(nUnlabeled));
logProbabilityTotalSupervised = zeros(size(nUnlabeled));
nTest = 20;

for i = 1:nTest
    disp(i);
    counter = 0;
    for nU = nUnlabeled
        counter = counter+1;

        idx = randperm(N);
        idxLabeled = idx(1:nLabeled);
        idxUnlabeled = idx(nLabeled+1:nLabeled+nU);
        idxTest = idx(nLabeled+nU+1:nLabeled+nU+numberTest);


        XLabeled = X(idxLabeled,:);
        XUnlabeled = X(idxUnlabeled,:);
        XTest = X(idxTest,:);
        YLabeled = Y(idxLabeled);
        YUnlabeled = Y(idxUnlabeled);
        YTest = Y(idxTest);


        kLabels = YLabeled;
        kTrue = YUnlabeled;
        XKLabeled = XLabeled;
        XKUnlabeled = XUnlabeled;
        temp2 = YUnlabeled;
        for j = 1:ceil(nU/k)
            %[kNewLabels, kTrueLabels, XKLabeled, XKUnlabeled] = kNearest(XKLabeled,XKUnlabeled,YLabeled,YUnlabeled,k);
            
                [IDX,D] = knnsearch(XKLabeled,XKUnlabeled);

                    temp = kLabels(IDX);
                    A = [temp ,temp2,D,XKUnlabeled];
                    A = sortrows(A,3);

                    kNewLabels = A(1:k,1);
                    kTrueLabels = A(1:k,2);
                    
                    temp2 = A(k+1:end,2);
                    
                    kLabels = [kLabels;kNewLabels];                 % Need for LDA
                    kTrue = [kTrue;kTrueLabels];                    % Need for error!
                    
                    
                    XKLabeled = [XKLabeled;A(1:k,4:end)];           % Labeled Set
                    XKUnlabeled = A(k+1:end,4:end);                 % Unlabeled Set
    
    

        end
        
        LDA = fitcdiscr(XKLabeled,kLabels,'DiscrimType','linear','SaveMemory','off','Gamma',0);
        LDASupervised = fitcdiscr(XLabeled,YLabeled,'DiscrimType','linear','SaveMemory','off','Gamma',0);

        YPredict = predict(LDA,XTest);
        YPredictSupervised = predict(LDASupervised,XTest);

        errorSemiSupervised(counter) = norm((YPredict-1)-(YTest-1),1)/(numberTest);
        errorSupervised(counter) = norm((YPredictSupervised-1)-(YTest-1),1)/numberTest;
        logProbability(counter) = sum(LDA.logP(XTest));
        logProbabilitySupervised(counter) = sum(LDASupervised.logP(XTest));
    end

    TotalErrorSemiSupervised = TotalErrorSemiSupervised+errorSemiSupervised;
    TotalErrorSupervised = TotalErrorSupervised+errorSupervised;
    logProbabilityTotal = logProbabilityTotal + logProbability;
    logProbabilityTotalSupervised = logProbabilityTotalSupervised + logProbabilitySupervised;
end
    TotalErrorSemiSupervised = TotalErrorSemiSupervised/nTest
    TotalErrorSupervised = TotalErrorSupervised/nTest
    logProbabilityTotal = logProbabilityTotal/nTest
    logProbabilityTotalSupervised = logProbabilityTotalSupervised/nTest

    %%
%     plot(nUnlabeled, 100*(1-kmeanTotalErrorSemiSupervised))
%     hold on 
%     plot(nUnlabeled, 100*(1-TotalErrorSupervised))
%     legend('Semi-Supervised','Supervised' ,'Location','southwest')
%     xlabel('n unlabeled samples')
%     ylabel('Accuracy %')

%%
plot(nUnlabeled, logProbabilityTotal)
hold on 
plot(nUnlabeled, kmeanslogProbabilityTotal)
plot(nUnlabeled, kmeanslogProbabilityTotalSupervised)
xlabel('n unlabeled samples')
ylabel('Log-likelihood')
legend('Knn Semi-Supervised', 'K-means Semi-Supervised', 'Supervised' ,'Location','southeast')