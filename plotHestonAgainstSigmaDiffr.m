function price = plotHestonAgainstSigmaDiffr()
S0 = 100;
r =[0.01,0.05,0.1,0.2];

kappa = 0.4;
sigma = 0:0.01:0.5;

delta = 0.3;
rho = -0.4;
N = 1250;
T = 5;
P = 2000;
% xh = [(0.03:0.02:0.12)',(0.15:-0.02:0.06)'];
w = 0.02;
xh = [(0.03:w:0.12)',(0.15:-w:0.06)' * 0 + 0.01];


sz = length(r);
sd = length(sigma);
price = nan(sz, sd);
for i = 1:sz
    for j = 1:sd
    rng(999);
    S = multiHeston(S0, sigma(j), r(i), kappa, sigma(j)^2, delta, rho, T, N, P);
    price(i,j) = multiWCEHPrice(S,xh,r(i));
    end
end

    