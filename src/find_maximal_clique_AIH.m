function estimated_clique_number = find_maximal_clique_AIH(G, x, C)
    delta = 0.01;

    q = undirected_density(G);
    for unwanted_clique_size = C:-1:1
        if sum(x~=0)<=1
            disp("warning");
            break;
        end

        hypsilon = (C-unwanted_clique_size)/2;
        gamma_hat = annealing_schedule(unwanted_clique_size, q, hypsilon, delta);
        gamma_hat_new = annealing_schedule(unwanted_clique_size-1, q, hypsilon, delta);
        alpha = (gamma_hat+gamma_hat_new)/2;
        if alpha >= 0
            break;
        end
        
        x = annealing_replicator_dynamics(x, G, alpha);

        x_b = make_characteristic(x, G);
        if is_a_maximal_clique(x_b, G)
            break;
        end
        x(x<1e-6) = 0;
    end

    x_b = make_characteristic(x, G);
    if is_a_maximal_clique(x_b, G)
        estimated_clique_number = 1/(2*(1 - bomze(G, x_b)));
    else
        estimated_clique_number = find_maximal_clique_RD(G, x);
    end
end