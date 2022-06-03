function B = rand_sub_isomorphism(A, m)
    n = size(A, 1);
    v = randperm(n);
    v = v(1:m);
    B = A(v(:), v(:));
end