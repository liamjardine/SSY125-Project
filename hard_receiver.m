function message = hard_receiver(y, encoder)
    y_r = heaviside(real(y));
    y_i = heaviside(imag(y));
    y_bit = [y_r; y_i];
    y_bit = y_bit(:)'; % Reshape to a row vector

    switch encoder
        case 0
            message = y_bit;
        case 1
            message = viterbi(y_bit);
        otherwise
            error('Invalid encoder type');
    end
end