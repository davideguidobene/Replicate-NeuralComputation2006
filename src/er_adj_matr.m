function A = er_adj_matr(n, p)
    A = zeros(n);
    A(triu(rand(n)) > 1-p) = 1;
    A = A.*~eye(n);
    A = A + (A.');
end