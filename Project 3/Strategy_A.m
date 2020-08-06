clear all 
clc

z=[0 0 1 0; 0.1 0 0 0.9; 0.2 0.1 0 0];
p= zeros(3:4);
p(:,1)= [1/3; 1/3; 1/3];

cm = Cum_Loss(z)
ml = zeros(1,3);

for i=1:4
    ml(i) = mixLoss(p(:,i),z(:,i));
    [value, index] = min(cm(:,i));
    p(index,i+1)= 1
end

Total_Mix_Loss = sum(ml)


Expert_Regret = Total_Mix_Loss - min(cm(:,4))
