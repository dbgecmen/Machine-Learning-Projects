function cm = cumulativeLoss(z)
cm = zeros(size(z(:,1)));
for i = 1:size(z(:,1))
    e = zeros(size(z(:,1)));
    e(i) = 1;
    cm(i) = mixLoss(e,z);
end

%disp(cm);
end