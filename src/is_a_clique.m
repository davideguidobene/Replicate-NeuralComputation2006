function bool = is_a_clique(y, G)
    n = size(y, 1);
    H = G(y, y)+eye(n);
	bool = all(H, 'all');
end