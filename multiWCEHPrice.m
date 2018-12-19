function v0=multiWCEHPrice(S,xh,r)

% Compute the averaged discounted payoff given periodic asset prices

% INPUT:
% S: P x T array of asset prices resampled at each period for T periods and P simulations 
%     i.e. [[S1_t_0, S1_t_0,... ,S1_t_N];[S2_t_0, S2_t_0,... ,S2_t_N];... ;[SP_t_0, SP_t_0, ...,SP_t_N];]
% xh: k x 2 array with boundaries (X) in the first column, layer height (h) in the second columns
%     i.e. [X_1, h_1; X_2, h_2;... ; X_k, h_k]
% r: risk-free rate (asset growth rate)

% OUTPUT:
% v0: averaged discounted payoff

k=length(S(:,1));
n=length(S(1,:));
m=length(xh(:,1));
totalPayoff=0;
for it=1:k
    ret=S(it,2:n)./S(it,1:n-1) -1;
    tmp_xh = xh;
    for i=1:n-1
        maxX = 0;
        payoff = 0;
        for j=1:m
            if abs(ret(i)) <= tmp_xh(j,1) && tmp_xh(j,2) > 0
                payoff = payoff + tmp_xh(j,2);
                if maxX == 0
                    maxX = j;
                else
                    if tmp_xh(maxX,1) > tmp_xh(j,1)
                        maxX = j;
                    end
                end
            end
        end
        if maxX ~= 0
            tmp_xh(maxX,2)=0;
        end
        totalPayoff = totalPayoff + payoff*exp(-r*i);
    end
end

v0=totalPayoff/k;

end
    
            
