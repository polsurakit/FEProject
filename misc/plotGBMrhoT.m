function price = plotGBMrhoT()
% function price = plotGBMrho(S0, r, sigma, T, P,  xh)

S0 = 100;
% r = 0.0:0.005:0.2;
r = (0.0:0.005:0.2) + 0.001;
sigma = 0.3;
T = [1,2,5,10,15];
P = 20000;
xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];

rsz = length(r);
tsz = length(T);

price = nan(rsz,tsz);

for rf = 1:rsz
    for t = 1:tsz
        rng(999);
        S = simGBM(S0, r(rf), sigma, T(t), T(t), P);
        price(rf, t) = multiWCEHPrice(S,xh,r(rf));
    end
end

% leg1 = legend('Price (V)', '$\partial V / \partial r$')
% set(leg1,'FontSize',20);
