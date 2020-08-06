[dataset, labels] = gendatmilsival(bagapp, bagban);
bagid = getident(dataset,'milbag');

model = dataset*fisherc;  %train classifier
D = dataset*model;          %apply classifier on training set
instancelabels = labeld(dataset,model);

baglabels = combineinstlabels(bagid,instancelabels);
nerrors = sum(abs(baglabels-labels));
errors = 100*nerrors/(length(labels));
errorstr = ['Naive MIL error rate is ' num2str(errors) '%'];
disp(errorstr)
