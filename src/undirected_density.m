function d = undirected_density(G)
    n = size(G, 1);
    d = sum(G, 'all')/(n*(n-1)); %(sum(G, 'all')/2) / (n*(n-1)/2)
end