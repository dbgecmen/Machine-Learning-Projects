function [b1,b2] = citknn(k,knn)
b1 = 0; b2 = 0;
knn(:,k) = zeros(size(knn,1),1);
for k=1:size(knn,2)
    if sum(knn(:,k)==k)>0
        if k <= 60
            b1 =b1 + 1;
        else
            b2 =b2 + 1;
        end
    end
end
end

