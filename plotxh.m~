function price = plotxh(S0, r, sigma, T, P,  xh,xhsz)


sz = length(sigma);
price = nan(sz, 1);
for i = 1:sz
    rng(999);
    S = simGBM(S0, r(i), sigma, T, T, P);
    price(i) = multiWCEHPrice(S,xh,r(i));
end


