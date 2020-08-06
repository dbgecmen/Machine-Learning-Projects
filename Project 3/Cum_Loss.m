function closs = Cum_Loss(z)
closs = zeros(3,4);
closs(:,1)=z(:,1);
closs(:,2)=z(:,1)+z(:,2);
closs(:,3)=z(:,1)+z(:,2)+z(:,3);
closs(:,4)=z(:,1)+z(:,2)+z(:,3)+z(:,4);
end