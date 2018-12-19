% function price = plotGBMwrtrfsigma(S0, r, sigma, T, P,  xh)
function price = plotGBMwrtrfsigma()
S0 = 100;
r = [0.01,0.03,0.05,0.1,0.2];
sigma = 0:0.01:1;
T = 5;
P = 20000;
% xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];
w = 0.02;
xh = [(0.03:w:0.12)',(0.15:-w:0.06)' * 0 + 0.01];

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
plot(sigma,price')
label(r)
