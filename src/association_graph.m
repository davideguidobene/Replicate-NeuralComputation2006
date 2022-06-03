function G = association_graph(A, B)
    n = size(A, 1);
    m = size(B, 1);
    G = kron(A, B) + kron(1-A-eye(n), 1-B-eye(m));
end