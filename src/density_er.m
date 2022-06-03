function A = density_er(n, d)
    max_ones = n*(n-1)/2;
    m = round(max_ones*d);
    triuA = zeros([1, max_ones]);
    triuA(1:m) = 1;
    triuA = shuffle(triuA);

    A = zeros(n);
    A(logical(triu(ones(n), 1))) = triuA;
    A = A + (A.');
end

function v = shuffle(v)
    v=v(randperm(length(v)));
end