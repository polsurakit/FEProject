function meanHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P)

S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, lambda, eta, alpha, T, N, P);
ret = S(:,2:end)./S(:,1:end-1) -1;
figure;
histogram(ret,300);
% disp([mean(reshape(ret,80000,1)), sqrt(var(reshape(ret,80000,1)))]);
% % disp(mean(reshape(ret,80000,1)));
