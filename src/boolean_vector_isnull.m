function y = boolean_vector_isnull(x, G)
    n = sum(x~=0, "all"); %size(x, 1);
    set = unique(x(x < 1/n));
    set = sort(set);
    y = x<=0;
    for i=1:size(set, 1)
        if is_a_clique(find(~y), G)
            break;
        end
        y = x<=set(i, 1);
    end
    if ~ is_a_clique(find(~y), G)
        y = x<1e-6;
    end
end