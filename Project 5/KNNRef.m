function [b1,b2]=refknn(k,knn)
a = knn(:,k);
b1 = sum(a<=60);
b2 = sum(a>60);
end

