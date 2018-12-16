function plotPriceHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P, xh)


sz = length(kappa);
price = nan(sz, 1);
for i = 1:sz
    rng(999);
    S = multiHeston(S0, sigma0, r, kappa(i), theta, delta, rho, lambda, eta, alpha, T, N, P);
    price(i) = multiWCEHPrice(S,xh,r);
end
figure;
plot(kappa, price);
    