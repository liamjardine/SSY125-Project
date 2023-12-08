function u_hat = viterbi(data)
    t_max = length(data) / 2;
    data = reshape(data, 2, [])';
    u_hat = -1 * zeros(1, t_max);
    D = [0; inf; inf; inf];
    D_mat = [0 inf; inf inf; 0 inf; inf inf];
    I = zeros(4, t_max) + inf;
    c1c2 = [0 0; 1 1; 0 1; 1 0; 1 1; 0 0; 1 0; 0 1]; 

    for t = 1:t_max
        lamda = sum(bitxor(repmat(data(t, :), 8, 1), c1c2), 2);
        lamda_mat = reshape(lamda, 2, [])';
        D_mat = D_mat + lamda_mat;
        [D, I(:, t)] = min(D_mat, [], 2);
        D_mat = reshape([D' D'], 2, [])';
    end

    state = 1;
    transitions = [1 2; 3 4; 1 2; 3 4]; 

    for t = t_max:-1:1
        temp = I(state, t);

        if state <= 2
            u_hat(t) = 0;
        else
            u_hat(t) = 1;
        end

        state = transitions(state, temp);
    end
end