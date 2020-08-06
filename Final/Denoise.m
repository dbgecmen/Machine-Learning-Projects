% Denoise testdata using singular value decomposition
clear all;
clc; 


data = load('test.csv');
[U,S,V] = svd(data);