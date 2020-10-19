function [theta , j_his] = gradient(x , y , theta , alpha , iter)
    m = length(y);
    j_his = [];
    for i = 1:iter
        h = x * theta;
        theta -= alpha * (1 / m) * (sum((h - y) .* x)');
        j_his(i) = cost(x , y , theta);
    end;
end;        