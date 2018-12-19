function [S, sigma] = SimHestonJump(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N)

% [S, sigma] = SimHestonJump(100, 0.5, 0.15, 0.5, 0.4^2, 0.3, -0.9, 0.001, -0.5, 1 , 10, 2500);

%Based on Heston Model with Jump

% r can be real average returns if you want the real-world drift.
% use risk-free rate if want to see under risk-neutral world

% Compute the Heston model path.
% sigma0: initital annualized volatility
% kappa: speed of mean reversion of variance
% theta: long-run value of variance
% delta: scale parameter of the variance in the variance process
% rho: correlation between returns and variance noises
% lambda: probability of jump arrival per period
% eta: jump size of price (percentage)
% alpha: jump size of volatility

% P = price
% CI = 95% - confidence interval

% Heston Model:
% 
% S_{n+1} = S_n exp((r- 0.5*sigma_n^2)*dt + sigma_n*sqrt{dt}*epsilon^1_{n+1})
% sigma_{n+1}^2 = sigma_n + kappa*(theta - sigma^2_n)*dt + delta*sigma*sqrt{dt}*epsilon^2_{n+1}
% 
% corr(epsilon^1, epsilon^2) = rho

epsilon_mean = [0,0];
epsilon_cov = [1, rho; rho, 1];

dt = T/N;

S = nan(N+1,1);
S(1,1) = S0;

sigma = nan(N+1,1);
sigma(1,1) = sigma0;

sigma2 = sigma0^2;

for i = 1:N
    epsilons = mvnrnd(epsilon_mean, epsilon_cov);
    
    jump_condition = (rand(1) < lambda);
    S_jumpsize = eta*S(i)*jump_condition; % absolute jump size is percentage of current stock price
    
    
    S(i+1) = S(i)*exp((r - 0.5 * sigma2)*dt + sqrt(dt*sigma2)*epsilons(1)) ...
        + S_jumpsize;
    sigma2 = sigma2 + kappa*(theta - sigma2)*dt + delta*sqrt(dt*sigma2)*epsilons(2) ...
        + ((1+alpha)^2 - 1)*sigma2*jump_condition;
    sigma2 = max(sigma2,0); % force positive
    sigma(i+1) = sqrt(sigma2);
end
ret = diff(log(S));

figure;
subplot(3, 1, 1);  %2*1 matrix of plots, plotting at position 1
plot(0:dt:T, S, 'm');
xlabel('Time');
ylabel('Stock Price');

subplot(3,1,2);
plot(dt:dt:T,ret, 'r');
xlabel('Time');
ylabel('LogReturns');

subplot(3,1,3);
plot(0:dt:T,sigma, 'c');
xlabel('Time');
ylabel('LogReturns Volatility');
