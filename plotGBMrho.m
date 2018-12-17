function price = plotGBMrho()
% function price = plotGBMrho(S0, r, sigma, T, P,  xh)

S0 = 100;
r = -1:0.005:1;
r = (-1:0.005:1) + 0.001;
sigma = 0.3;
T = 5;
P = 20000;
xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];

rsz = length(r);
sdsz = length(sigma);

price = nan(rsz,sdsz);

for rf = 1:rsz
    for sd = 1:sdsz
        rng(999);
        S = simGBM(S0, r(rf), sigma(sd), T, T, P);
        price(rf,sd) = multiWCEHPrice(S,xh,r(rf));
    end
end

figure;
plot(r,price)

% leg1 = legend('Price (V)', '$\partial V / \partial r$')
% set(leg1,'FontSize',20);
