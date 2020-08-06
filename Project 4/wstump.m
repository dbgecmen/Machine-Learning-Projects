function [ feature, theta, sign, Error ] = wstump( X,y,w )
%Implementation of a `weak learner?: the decision stump.
[n,features] = size(X); %returns the size of matrix X in separate variables n and features
thetaexperiment = linspace(min(min(X)),max(max(X)),n*features);

Error = 100*n;
    for i = flip(1:length(thetaexperiment))
         Est1 = X<thetaexperiment(i); %Return a logical array with 1 if X<thetaexperiment(i) and 0 otherwise
         Est2 = X>=thetaexperiment(i); %Return a logical array with 1 if X>=thetaexperiment(i) and 0 otherwise 
  
         Err1 = sum((Est1~=y).*w)/length(y);
         Err2 = sum((Est2~=y).*w)/length(y);
        
        [MinError1, f1] = min(Err1);
        [MinError2, f2] = min(Err2);
  
        if MinError1 < Error || MinError2 < Error
             if MinError1<MinError2
                 Error=MinError1;
                 feature=f1;
                 theta = thetaexperiment(i);
                 sign = 0; % The sign is <
             else
                 Error=MinError2;
                 feature=f2;
                 theta = thetaexperiment(i);
                 sign = 1; % The sign is >=
             end
        end
    end
end

        

  
  