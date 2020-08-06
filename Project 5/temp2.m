load('apple'); load('banana');
sigma = 6;
[dataset, labels] = gendatmilsival(apple, banana);
bagid = getident(dataset,'milbag');
MB = zeros(max(bagid),length(dataset.data));

for i = 1:max(bagid)
    MB(i,:) = bagembed(dataset.data,dataset.data((bagid == i), :),sigma);
end

dataset_miles	= prdataset(MB,labels);  
model = liknonc(dataset_miles);
baglabels = labeld(dataset_miles,model);
nerrors = sum(abs(baglabels-labels));
errors = 100*nerrors/(length(labels));



