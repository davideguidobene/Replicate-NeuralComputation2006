function xB = noise(x, epsilon)
    x1 = (x + abs(normrnd(0, epsilon, size(x, 1), 1)));
    xB = x1/sum(x1);
end