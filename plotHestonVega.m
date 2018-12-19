% function price = plotwrtkappa(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)
function vega = plotHestonVega(theta)

% plotPriceHeston(100, 0.5, 0.05, 0.4, 0.4^2, 0.3, -1:0.02:1, 0.00, -0.5, 1 , 5, 1250,1000, xh);

S0 = 100;
r = 0:0.01:1;

kappa = 0.4;
% theta = 0.4;

delta = 0.3;
rho = -0.4;
N = 1250;
T = 5;
P = 2000;
% xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];
w = 0.02;
xh = [(0.03:w:0.12)',(0.15:-w:0.06)' * 0 + 0.01];

rsz = length(r);
price = nan(rsz,1);

for rf = 1:rsz
    rng(999);
    S = multiHeston(S0, theta, r(rf), kappa, theta^2, delta, rho, T, N, P);
    price(rf) = multiWCEHPrice(S,xh,r(rf));
end
p1 = price;

theta = theta + 0.0001;
for rf = 1:rsz
    rng(999);
    S = multiHeston(S0, theta, r(rf), kappa, theta^2, delta, rho, T, N, P);
    price(rf) = multiWCEHPrice(S,xh,r(rf));
end
p2 = price;
vega = (p2-p1)/0.0001;

