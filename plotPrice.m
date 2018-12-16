function price = plotPrice(S0, r, sigma, T, P,  xh)


sz = length(r);
price = nan(sz, 1);
for i = 1:sz
    rng(999);
    S = simGBM(S0, r, sigma(i), T, T, P);
    price(i) = multiWCEHPrice(S,xh,r);
end


