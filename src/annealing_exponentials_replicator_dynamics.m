function x = annealing_exponentials_replicator_dynamics(x, G, alpha)
    N = size(G, 1);
    W = G + eye(N)*alpha;
    iter_max = 1e6;
    epsilon = 1e-6;
    dist = inf;
    i = 1;
    k = 2;
    while dist>epsilon && i<=iter_max
        x_old = x;
        avg_payoff = W*x;        
        x = x.*exp(k*avg_payoff);        
        x = x/sum(x);        
        dist = norm(x - x_old); %pdist([x, x_old]');
        i = i+1;
    end
%     if i>=iter_max
%         disp("TOO many iterations");
%     end
end