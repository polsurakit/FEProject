function totalPayoff=multiWCEHPriceList(S,xh,r)

%S=[[S11,S12,S13,...,S1n],[S21,S22,S23,...,S2n],...,[Sk1,Sk2,Sk3,...,Skn]]
%xh=[x1,h1; x2,h2; x3,h3; ...; xm,hm]
k=length(S(:,1));
n=length(S(1,:));
m=length(xh(:,1));
totalPayoff=zeros(k,1);
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
        totalPayoff(it,1) = totalPayoff(it,1) + payoff;
    end
end
end
    
            
