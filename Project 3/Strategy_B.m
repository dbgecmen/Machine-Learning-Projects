clear all 
clc

z=[0 0 1 0; 0.1 0 0 0.9; 0.2 0.1 0 0];
p= zeros(3:4);
p(:,1)= [1/3; 1/3; 1/3];

cm = Cum_Loss(z)
ml = zeros(1,3);

C=zeros(1,3)

for i=1:4
    C(:,i)=sum(exp(-cm(:,i)))
    p(:,i+1)= exp(-cm(:,i))/C(:,i)
    ml(i) = mixLoss(p(:,i),z(:,i));
end

Total_Mix_Loss=sum(ml)
Expert_Regret = Total_Mix_Loss - min(cm(:,4))


