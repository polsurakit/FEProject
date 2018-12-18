% function price = plotwrtkappa(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)
function price = plotwrtkappa()

% plotPriceHeston(100, 0.5, 0.05, 0.4, 0.4^2, 0.3, -1:0.02:1, 0.00, -0.5, 1 , 5, 1250,1000, xh);

S0 = 100;
r = 0.05;
sigma0 = 0.05;

kappa = 0:0.01:0.5;
theta = [0.01, 0.05, 0.1, 0.2, 0.5];

delta = 0.3;
rho = -0.4;
lambda = 0;
eta = 0.5;
alpha = 0.5;
N = 1250;
T = 5;
P = 20000;
% xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];
w = 0.02;
xh = [(0.03:w:0.12)',(0.15:-w:0.06)' * 0 + 0.01];

thetasz = length(theta);
kappasz = length(kappa);

price = nan(thetasz,kappasz);

for th = 1:thetasz
    for kp = 1:kappasz
        rng(999);
        S = multiHeston(S0, sigma0, r, kappa(kp), theta(th)^2, delta, rho, lambda, eta, alpha, T, N, P);
        price(th,kp) = multiWCEHPrice(S,xh,r);
    end
end

