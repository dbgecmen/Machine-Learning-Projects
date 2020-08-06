clear all
clc

z = [0 0 1 0; 0.1 0 0 0.9; 0.2 0.1 0 0];

lm = zeros(3,1);
cm = zeros(3,4);
p = zeros(3,4);
p(:,1) = 1/3;

for i = 1:4
    lm(i) = mixLoss(p(:,i),z(:,i));
    cm(:,i+1) = cm(:,i)+cumulativeLoss(z(:,i));
    [M,I] = min(cm(:,i+1));
    p(I,i+1) = 1; 
end

regret = sum(lm) - min(cm(:,end))