fprintf("\nLoading dataSet...");
data = load('ex1data2.txt');
x = data(:,1:2);
y = data(:,3);
m = length(y);
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [x(1:10,:) y(1:10,:)]');
fprintf("\nPress Enter to continue.\n");
pause;
fprintf("\nNormalizing features...\n");
[x mu sigma] = normaliz(x);
% Add extra coloumn of 1 in x
x = [ones(m , 1) , x];
fprintf("\nRunning gradient descend...\n");
% Choose alpha and number of iterations such that the cost is minimum if the cost comes in like 7e + something then
% plot cost / 10^10 if it comes as like 7e - something then multiply the cost by 10^10
theta = zeros(size(x , 2) , 1);
alpha = 1;
iteration = 100;
[theta , j_history] = gradientdescend(x , y , theta , alpha , iteration);
figure;
plot(1:numel(j_history), (j_history ./ (10^10)), '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
price = [1 , (1650-mu(1))/sigma(1) , (3-mu(2))/sigma(2)] * theta;
fprintf("\nPrice from gradientdescend: %f\n",price);
% Here we are computing using normal equation which is useful for low amount of features in our data set. We don't have to set alpha and number of iterations.
data = load('ex1data2.txt');
x = data(:, 1:2);
y = data(:, 3);
m = length(y);
x = [ones(m, 1) , x];
theta = normaleq(x, y);
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');
price = price = [1 , 1650 , 3] * theta; % direct values are taken because for normal equation we have not taken x and y as normalized form.
fprintf("\nPredicted price from normal equation: %f\n",price);
