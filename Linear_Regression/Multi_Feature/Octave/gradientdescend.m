function [theta , j_history] = gradientdescend(x , y , theta , alpha, iteration)
    m = length(y); % number of training examples
    j_history = zeros(iteration, 1);
    for iter = 1:iteration
        h = x * theta; % hypothesis
    	theta -= alpha * (1 / m) * (sum((h - y) .* x)');
        j_history(iter) = costmulti(x , y , theta);
    end;
end;