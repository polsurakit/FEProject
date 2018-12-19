function S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, T, N, P)

% S = multiHeston(100, 0.5, 0.05, 0.5, 0.4^2, 0.3, -0.9, 0.001, -0.5, 1 , 10, 2500,10000);

% Based on Heston Model with Jump

% Compute the Heston model path.
% sigma0: initital annualized volatility
% kappa: speed of mean reversion of variance
% theta: long-run value of variance
% delta: scale parameter of the variance in the variance process
% rho: correlation between returns and variance noises
% lambda: probability of jump arrival per period
% eta: jump size of price (percentage)
% alpha: jump size of volatility
% P: number of simulations

dt = T/N;
eps1 = randn(P,N);
eps2 =  rho*eps1 + sqrt(1- rho^2)*randn(P,N);

S = nan(P, N+1);
S(:,1) = S0;

var = nan(P,1); 
var(:,1) = sigma0^2;

lambda = 0; 

for i = 1:N
%     jump_condition = (rand(P,1) < lambda);
%     
%     S_jump = eta*S(:,i).*jump_condition;
%     var_jump = ((1+alpha)^2 - 1)*var.*jump_condition;
    
    S(:,i+1) = S(:,i).*exp((r - 0.5 * var)*dt + sqrt(dt*var).*eps1(:,i));
    
    var = var + kappa*(theta - var)*dt + delta*sqrt(dt*var).*eps2(:,i);
    var = max(var,0);
end

S = S(:, 1:N/T:N); %Yearly samples


