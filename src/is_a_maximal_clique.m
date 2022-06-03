function bool = is_a_maximal_clique(x, G)
    y = find_isnotnull(x, G);
    z = find_isnull(x, G);
    y1 = find(x>1e-6);
    z1 = find(x<=1e-6);
    bool1 = is_a_clique(y1, G) && is_maximal(y1, z1, G);
    bool = is_a_clique(y, G) && is_maximal(y, z, G);
    if bool1 && ~bool
        disp(bool);
        disp(bool1);
        disp(x);
        disp(is_a_clique(y, G));
        disp(is_a_clique(y1, G));
        error("stop");
    end
end