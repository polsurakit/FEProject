function S =  simGBM(S0, r, sigma, T, N, P)

% Return P x N array of simulated asset prices under risk-neutral GBM
% 
% INPUT:
% S0: initial asset price
% r: risk-free rate (asset growth rate)
% sigma: instantaneous volatility
% T: number of years to simulate
% N: number of time steps per T
% P: number of simulations
% 
% OUTPUT:
% S: P x N array of simulated asset prices under risk-neutral GBM

dt = T/N;
eps = randn(N, P);
ST = exp((r-0.5*sigma^2)*dt + sigma*sqrt(dt)*eps);
S = nan(N+1, P);
S(2:end,:) = ST;
S(1,:) = S0;
S = cumprod(S,1)';