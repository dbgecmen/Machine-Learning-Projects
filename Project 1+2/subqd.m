%%
r1 = 1;
sigma = 0.2
th = 0:pi/500:2*pi;
xunit = r1 * cos(th) + sigma*randn(1001,1)';
yunit = r1 * sin(th) + sigma*randn(1001,1)';
h = scatter(xunit, yunit) ;

r2 = 2;
sigma = 0.2
xunit2 = r2 * cos(th) + sigma*randn(1001,1)';
yunit2 = r2 * sin(th) + sigma*randn(1001,1)';
hold on 
h = scatter(xunit2, yunit2) ;
xlabel('Feature 1')
ylabel('Feature 2')
legend('Class 1', 'Class 2')


%%
x1 = randn(1000,1)*5;
y1 = randn(1000,1)*5-7;

x2 = randn(1000,1)*5;
y2 = randn(1000,1)*5+7;
scatter(x1,y1)
hold on
scatter(x2,y2)
xlabel('Feature 1')
ylabel('Feature 2')
legend('Class 1', 'Class 2')

