function j = cost(x , y , theta)
    m = length(y);
    hypothesis = x * theta;
    err = (hypothesis - y) .^ 2;
    j = (1/(2*m))*sum(err);
end;    