function W = orthogonal_init(d)
    G = randn(d);
    [Q, ~] = qr(G);
    if det(Q) < 0
        Q(:,1) = -Q(:,1);
    end
    W = Q;
end