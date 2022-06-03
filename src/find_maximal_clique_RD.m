function estimated_clique_number = find_maximal_clique_RD(G, x)
    x = annealing_replicator_dynamics(x, G, 0);
    x = replicator_dynamics(x, G);
    estimated_clique_number = 1/(2*(1 - bomze(G, x)));
end