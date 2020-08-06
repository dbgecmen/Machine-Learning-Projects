% clear all
N1 = 12332;
N2 = 6688;
N = N1+N2;
X = load('magic.txt');
Y = X(:,11);
X = X(:,1:10);
%X = [randn(N1,10)*5-5;randn(N2,10)*5+5];
X = X./std(X);

%%% Second Assignment %%%
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
        
        
        initialSeeds = [(XLabeled'*(YLabeled==1)/sum(YLabeled==1))' ; (XLabeled'*(YLabeled==2)/sum(YLabeled==2))'];
        KMEANS = kmeans(XUnlabeled,2,'Start',initialSeeds);
        

        LDA = fitcdiscr([XLabeled;XUnlabeled],[YLabeled;KMEANS],'DiscrimType','linear','SaveMemory','off','Gamma',0);
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
%     
%     plot(nUnlabeled, 100*(1-TotalErrorSemiSupervised))
%     hold on 
%     plot(nUnlabeled, 100*(1-knnTotalErrorSemiSupervised))
%     plot(nUnlabeled, 100*(1-TotalErrorSupervised))
%     legend('K-means Semi-Supervised', 'Knn Semi-Supervised', 'Supervised' ,'Location','east')
%     xlabel('n unlabeled samples')
%     ylabel('Accuracy %')