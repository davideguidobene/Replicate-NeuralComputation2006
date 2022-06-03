function y = bomze(A, x)
    n = size(A, 1);
    y = (x.')*(A + eye(n)/2)*(x); %eye(n) = I_n
end