function price = histGBM(S0, sigma0, r, T, P, xh)
rng(999)
% S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P);
S =  simGBM(S0, r, sigma0, T, T, P);
price = multiWCEHPriceList(S,xh,r);

    