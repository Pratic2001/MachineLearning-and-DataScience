function j = costmulti(x , y , theta)
    m = length(y);
    h = x * theta; % hypothesis function (Theta' * x = theta_0 + theta_1 * x_1)
    squaredErrors = (h - y) .^ 2;
    j = (1 / (2 * m)) * sum(squaredErrors);
end;