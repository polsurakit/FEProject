function plotPrice(S0, r, sigma, T, P,  xh)


sz = length(T);
price = nan(sz, 1);
for i = 1:sz
    rng(999);
    S = simGBM(S0, r, sigma, T(i), T(i), P);
    price(i) = multiWCEHPrice(S,xh,r);
end
h = figure;
plot(T, price);


