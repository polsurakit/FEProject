function [x,price] = plotPriceHeston(S0, sigma0, r, kappa, theta, delta, rho, T, N, P, xh, opt)

% plotPriceHeston(100, 0.5, 0.05, 0:0.01:1, 0.4^2, 0.3, -0.3, 0.00, -0.5, 1 , 5, 1250,1000, xh);
% sz = length(kappa);
% price = nan(sz, 1);
% for i = 1:sz
%     rng(999);
%     S = multiHeston(S0, sigma0, r, kappa(i), theta, delta, rho, lambda, eta, alpha, T, N, P);
%     price(i) = multiWCEHPrice(S,xh,r);
% end
% figure;
% plot(kappa, price);

switch opt
    case 'r'
        sz = length(r);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r(i), kappa, theta, delta, rho, T, N, P);
            price(i) = multiWCEHPrice(S,xh,r(i));
        end
        x = r;

    case 'sigma'
        sz = length(sigma0);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0(i), r, kappa, theta, delta, rho, T, N, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = sigma0;
    case 'kappa'
        sz = length(kappa);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r, kappa(i), theta, delta, rho, T, N, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = kappa;
    case 'theta'
        sz = length(theta);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r, kappa, theta(i), delta, rho, T, N, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = theta;
    case 'delta'
        sz = length(delta);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r, kappa, theta, delta(i), rho, T, N, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = delta;
    case 'rho'
        sz = length(rho);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho(i), T, N, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = rho;
    case 'T'
        sz = length(T);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, T(i), T(i), P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = T;
end