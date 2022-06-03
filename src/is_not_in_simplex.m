function bool = is_not_in_simplex(x)
    if isreal(x)
        bool = any(x<0);
    else
        bool = false;
    end
end