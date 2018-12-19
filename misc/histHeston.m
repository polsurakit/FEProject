function price = histHeston(S0, sigma0, r, kappa, theta, delta, rho, T, N, P, xh)
rng(999)

% S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, T, N, P);
S =  simGBM(S0, r, sigma0, T, T, P);
% price = nan(P,1);
% for p = 1:P
%     price(p) = WCEHPrice(S(p,:),xh,r);
% end
price = S(:,2)/100 -1;

    