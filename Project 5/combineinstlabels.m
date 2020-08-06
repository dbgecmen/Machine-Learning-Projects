function bagsLabels = combineinstlabels(bagid,instanceLabels)
% Accepts list of labels, and outputs a single label 
% obtained by majority voting.
bagsLabels = zeros(max(bagid),1);
for i = 1:max(bagid)
    if  sum((bagid == i).*(instanceLabels-1)) > sum((bagid == i).*0.5)
    bagsLabels(i) = 2;
    else
    bagsLabels(i) = 1;
    end
end







