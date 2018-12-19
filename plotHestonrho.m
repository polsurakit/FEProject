function price = plotHestonrho(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)

% plotPriceHeston(100, 0.5, 0.05, 0.4, 0.4^2, 0.3, -1:0.02:1, 0.00, -0.5, 1 , 5, 1250,1000, xh);
sz = length(rho);
price = nan(sz, 1);
for i = 1:sz
    rng(11242);
    S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho(i), lambda, eta, alpha, T, N, P);
    price(i) = multiWCEHPrice(S,xh,r);
end
