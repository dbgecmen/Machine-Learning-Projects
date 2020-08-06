test = load('test.csv');
train = load('train.csv');


%[coeff,score,latent] = pca(train', 'Centered', true, 'VariableWeights', 'variance');
[coeff,score,latent] = pca(train');