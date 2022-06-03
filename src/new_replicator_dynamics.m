function x = new_replicator_dynamics(x, G, alpha)
    N = size(G, 1);
    k = -alpha;
    iter_max = 1e5;
    epsilon = 1e-6;
    dist = inf;
    i = 1;
    while dist>epsilon && i<=iter_max
        e = x~=0;
        W = G + eye(N)*alpha + k*(e*e');
        
        if any(W<0, 'all')
            disp(e);
            disp(x);
            disp(e'*e);
            disp(W);
            disp(i);
            error("what??");
        end
        
        x_old = x;
        avg_payoff = W*x;
        x = x.*avg_payoff;
        x = x/sum(x);
        dist = norm(x - x_old); %pdist([x, x_old]');
        i = i+1;
        if is_not_in_simplex(x)
            disp(x(x<0));
            disp(x_old);
            disp(W);
            disp(x);
            error("not in simplex");
        end
    end
    if i>=iter_max
        disp("TOO many iterations");
    end
end