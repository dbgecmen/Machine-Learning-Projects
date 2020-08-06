import csv
import numpy as np

a=np.array([row for row in csv.reader(open('train.csv'))])
b=np.array([row for row in csv.reader(open('test.csv'))])

#  remove labels from training data
train = np.delete(a, np.s_[0:1], axis=1)

# define test set
test = b

p=2
r=1
n=204

eps = gamrnd(1 / p, p, [n, 1]);
eta = eps. ^ (1 / p);

#s = randn(n, 1);
#s = (s. / abs(s));
#x = s. * eta;

# w = rand(n, 1);
#z = w. ^ (1 / n);

#y = r * z. * (x. / norm(x, p));

