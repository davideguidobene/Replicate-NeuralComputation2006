function gamma_hat = annealing_schedule(m, q, hypsilon, delta)
    gamma_hat = 1-(1-q)*m-sqrt(m*q*(1-q))*(delta^hypsilon);
end