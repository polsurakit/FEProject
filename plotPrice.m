function [x,price] = plotPrice(S0, r, sigma, T, P,  xh, opt)

switch opt
    case 'r'
        sz = length(r);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = simGBM(S0, r(i), sigma, T, T, P);
            price(i) = multiWCEHPrice(S,xh,r(i));
        end
        x = r;

    case 'sigma'
        sz = length(sigma);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = simGBM(S0, r, sigma(i), T, T, P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = sigma;
    case 'T'
        sz = length(T);
        price = nan(sz, 1);
        for i = 1:sz
            rng(999);
            S = simGBM(S0, r, sigma, T(i), T(i), P);
            price(i) = multiWCEHPrice(S,xh,r);
        end
        x = T;
end


