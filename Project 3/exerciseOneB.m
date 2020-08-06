clear all
clc

z = [0 0 1 0; 0.1 0 0 0.9; 0.2 0.1 0 0];

lm = zeros(3,1);
cm = zeros(3,4);
p = zeros(3,4);
p(:,1) = 1/3;

for i = 1:4
    %lm(i) = mixLoss(p(:,i),z(:,i));
    cm(:,i+1) = cm(:,i)+cumulativeLoss(z(:,i));
    p(:,i+1) = exp(-cm(:,i+1))/norm(exp(-cm(:,i+1)),1);
end

regret =  min(cm(:,end))