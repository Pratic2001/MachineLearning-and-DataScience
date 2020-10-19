function [x_norm , mu , sigma] = normaliz(x)
    mu = zeros(1 , size(x , 2));
    sigma = zeros(1 , size(x , 2));
    n = size(x , 2);
    x_norm = x;

    for i = 1:n
        avg = mean(x(:,i));
        deviation = std(x(:,i));
        x_norm(:, i) = x_norm(:, i) - avg;
	    x_norm(:, i) = x_norm(:, i) / deviation;
        mu(i) = avg;
        sigma(i) = deviation;
    end;
end;            