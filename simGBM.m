function S =  simGBM(S0, r, sigma, T, N, P)

dt = T/N;
eps = randn(N, P);
ST = exp((r-0.5*sigma^2)*dt + sigma*sqrt(dt)*eps);
S = nan(N+1, P);
S(2:end,:) = ST;
S(1,:) = S0;
S = cumprod(S,1);