a = load('train.csv');
b = load('test.csv');

% remove labels from training data
train = a(:,2:end);


% define test set
test = b;

%%
figure
plot(eig(cov(test)),'r*');
title('n eigenvalues test dataset');
xlabel('n')
ylabel('value')

figure
plot(eig(cov(train)),'r*');
title('n eigenvalues train dataset');
xlabel('n')
ylabel('value')