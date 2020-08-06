
%% Exercise c
N=20;
MU1 = [0,0];    
MU2 = [2,0];  
SIGMA = eye(2);


A1 = mvnrnd(MU1,SIGMA,N);   
A2 = mvnrnd(MU1,SIGMA,N);

X = [A1;A2];

y = [zeros(N,1);ones(N,1)];






%% Exercise d




[f,theta,sign] = stump(X,y);
error1 = norm((X(:,f)>theta)-y,1)/(2*N);
error = stumpError(X,y,f,theta,sign);
disp(error1);

scatter(C1(:,1),C1(:,2), 0.001, 'r', 'LineWidth', 3);
hold on;
scatter(C2(:,1),C2(:,2), 0.001, 'b', 'LineWidth', 3);
grid on;
legend('Class 1','Class 2');
