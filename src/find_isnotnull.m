function y = find_isnotnull(x, G)
    y = find(~boolean_vector_isnull(x, G));
end