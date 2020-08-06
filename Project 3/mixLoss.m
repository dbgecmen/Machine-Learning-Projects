function lm = mixLoss(p,z)
lm = -log(sum(p.*exp(-z)));
end