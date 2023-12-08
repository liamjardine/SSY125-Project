function output = add_awgn(symbol,EbN0)
%AWGN Adding noise
%
Es = mean(abs(symbol).^2);
snr = 10^(EbN0/10);
n = length(symbol);
sigma = sqrt(Es/snr);
w = sigma*1/sqrt(2)*(randn(1,n)+1i*randn(1,n));
output = symbol + w;
end