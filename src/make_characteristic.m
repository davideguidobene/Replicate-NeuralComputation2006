function x_b = make_characteristic(x, G)
    x_b = x;
    x_b(find_isnull(x, G)) = 0;
    dims = find_isnotnull(x, G);
    x_b(dims, 1) = 1/size(dims, 1);
end