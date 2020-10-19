fprintf('\nVisualizing data...\n');
data = load('ex1data1.txt');
x = data(: , 1);
y = data(: , 2);
figure 1;
grid on;
xlabel('Population');
ylabel('Profit');
plot(x , y , 'rx');
fprintf("\nPress Enter to continue.\n");
pause;
m = length(y);
% Add an extra coloumn to the training set x %
x = [ones(m , 1) , data(: , 1)];
theta = zeros(2 , 1); % create theta where thete was suppoused to be a 1 x 2 but here we are taking 2 x 1 for convenience
iterations = 2000;
alpha = 0.01;
[theta , J_history] = gradient(x , y , theta , alpha , iterations);
hold on;
plot(x(:,2) , x*theta , '-');
legend('Data Points' , 'Linear Regression');
hold off;
fprintf("\nOptimal theta found at : %f %f",theta(1) , theta(2));
prediction = [1 , 7.0] * theta;
fprintf("\nPredicted value is: %f\n",prediction * 10000);
% Visualizing cost
theta_0 = linspace(-10,10,100);
theta_1 = linspace(-1,4,100);
j_val = zeros(100 , 100);
for i = 1:length(theta_0)
    for j = 1:length(theta_1)
        temp = [theta_0(i) , theta_1(j)];
        j_val(i , j) = cost(x,data(:,2),temp');
    end;
end;
j_val = j_val';
figure 2;
surf(theta_0,theta_1,j_val);
xlabel('theta 0');
ylabel('theta 1');
figure 3;
contour(theta_0, theta_1, j_val, logspace(-2, 3, 20))
xlabel('theta_0'); ylabel('theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2); 
figure 4;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of Iteration');
ylabel('Cost J');       
