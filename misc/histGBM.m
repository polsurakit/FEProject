function price = histGBM(S0,r, sigma0, T, P, xh)
% S0 = 100;
% r = 0.05;
% sigma0 = 0.1;
% T = 10;
% P = 100000;
% xh = [(0.03:0.06:0.12)',(0.15:-0.06:0.06)'];

rng(999)
% S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P);
S =  simGBM(S0, r, sigma0, T, T, P);
price = multiWCEHPriceList(S,xh,r);
figure;
histogram(price, 100);
    