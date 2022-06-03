function x = replicator_dynamics(x, G)
    N = size(G, 1);
    W = G + eye(N)/2;
    iter_max = 1e6;
    epsilon = 1e-6;
    dist = inf;
    i = 1;
    while dist>epsilon && i<=iter_max
        x_old = x;
        avg_payoff = W*x;
        x = x.*avg_payoff;
        x = x/sum(x);
        dist = norm(x - x_old); %pdist([x, x_old]');
        while ((dist<=epsilon) && (~is_a_maximal_clique(x, G)))
            new_x = noise(x, 1e-3);
            new_dist = norm(new_x - x_old);
            if new_dist>dist
                x = new_x;
                dist = new_dist;
            end
        end
        i = i+1;
    end
    if i>=iter_max
        disp("TOO many iterations");
    end
    x = make_characteristic(x, G);
end