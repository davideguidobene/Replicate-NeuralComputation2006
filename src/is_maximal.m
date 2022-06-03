function bool = is_maximal(y, z, G)
    bool = ~any(all(G(y, z), 1));
end
