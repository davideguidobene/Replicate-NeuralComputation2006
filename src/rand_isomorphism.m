function B = rand_isomorphism(A)
    v = randperm(size(A, 1));
    B = A(v(:), v(:));
end