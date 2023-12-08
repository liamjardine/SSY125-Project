function output = encoder(src, mod)
% ENCODER Performs convolutional encoding of some modulation

% Perform encoding based on the modulation type
switch mod
    case 0
        output = src;
    case 1
        d1 = [1, 0, 1];
        d2 = [1, 1, 1];
    case 2
        d1 = [1, 0, 1, 1, 1];
        d2 = [1, 0, 1, 1, 0];
    case 3
        d1 = [1, 0, 0, 1, 1];
        d2 = [1, 1, 0, 1, 1];
    otherwise
        error('Invalid modulation type');
end

if mod ~= 0
    u1 = rem(conv(src, d1), 2);
    u2 = rem(conv(src, d2), 2);

    interleaved_output = zeros(1, length(u1) + length(u2));
    interleaved_output(1:2:end) = u1;
    interleaved_output(2:2:end) = u2;

    output = interleaved_output;
end
end