% function price = plotwrtkappa(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)
function price = plotdeltaVaryR()

% plotPriceHeston(100, 0.5, 0.05, 0.4, 0.4^2, 0.3, -1:0.02:1, 0.00, -0.5, 1 , 5, 1250,1000, xh);

S0 = 100;
r = [0.01,0.05,0.1,0.2];

kappa = 0.3;
theta = 0.3;

delta = 0:0.01:1;
rho = -0.4;

N = 1250;
T = 5;
P = 2000;
% xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];
w = 0.02;
xh = [(0.03:w:0.12)',(0.15:-w:0.06)'*0 + 0.01];

sz1 = length(r);
sz2 = length(delta);

price = nan(sz1,sz2);

for param1 = 1:sz1
    for param2 = 1:sz2
        rng(999);
        S = multiHeston(S0, theta, r(param1), kappa, theta^2, delta(param2), rho, T, N, P);
        price(param1,param2) = multiWCEHPrice(S,xh,r(param1));
    end
end
figure;

plot(0:0.01:1,price);
legend('$r=0.01$','$r=0.05$','$r=0.1$','$r=0.2$')

