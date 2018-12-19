function r = simVasicek(r0,a,b, sigma, T,N,P)

% r0: interest rate at time 0
% a: speed of mean reversion
% b: long-run interest rate
% T: time (years)
% N: number of time steps per T
% P: number of simulations

dt = T/N;
eps = sqrt(dt)*randn(P,N);
timeVect = dt:dt:T;
eat = exp(-a*timeVect);
r = r0 * eat +  b*(1-eat) + sigma*eat.*cumsum(exp(a*timeVect).*eps,2);
