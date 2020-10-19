function [theta] = normaleq(x, y)
    theta = zeros(size(x, 2), 1);
    theta = pinv(x' * x) * x' * y;
end;    