function plotPriceHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)

% plotPriceHeston(100, 0.5, 0.05, 0:0.01:1, 0.4^2, 0.3, -0.3, 0.00, -0.5, 1 , 5, 1250,1000, xh);
sz = length(kappa);
price = nan(sz, 1);
for i = 1:sz
    rng(999);
    S = multiHeston(S0, sigma0, r, kappa(i), theta, delta, rho, lambda, eta, alpha, T, N, P);
    price(i) = multiWCEHPrice(S,xh,r);
end
figure;
plot(kappa, price);
    