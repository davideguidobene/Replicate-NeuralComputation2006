function bool = makes_a_clique(y, i, G)
    bool = all(G(y, i), 'all');
end