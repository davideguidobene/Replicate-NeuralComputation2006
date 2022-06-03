function x = annealing_replicator_dynamics(x, G, alpha)
    if ~isreal(alpha)
        error("absurd alpha");
    end
    N = size(G, 1);
    if alpha>=0
        W = G + eye(N)*alpha;
        if alpha > 0
            disp("warning positive alpha: " + alpha);
        end
    else
        W = G + ((~eye(N)) * (-alpha));
    end
    iter_max = 1e6;
    epsilon = 1e-6;
    dist = inf;
    i = 1;
    while dist>epsilon && i<=iter_max
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
        
        sum_x = sum(x);

        if sum(x) == 0
            x = x_old;
            break;
        end
        
        if sum(x) <= 0 || ~isreal(sum_x)
            disp(sum(x));
            error("wrong sum");
        end

        x = x/sum(x);
        dist = norm(x - x_old); %pdist([x, x_old]');
        if ~isreal(dist) || isinf(dist)
            error("dist is not real");
        end
        i = i+1;
        
        if is_not_in_simplex(x)
            disp("iter " + i);
            disp(x(x<0));
            disp(x_old);
            disp(W);
            disp(x);
            disp(sum(x));
            disp(sum_x);
            error("not in simplex");
        end
    end
    if i>=iter_max
        disp("TOO many iterations");
    end
end

%warning: x may end up out of symplex in case of negative values