    function v0=WCEHPrice(S,xh,r)

    %S=[S1,S2,S3,...,Sn]
    %xh=[x1,h1; x2,h2; x3,h3; ...; xm,hm]

    n=length(S);
    m=length(xh);
    ret=S(2:n)./S(1:n-1) -1 ;
    totalPayoff=0;

    for i=1:n-1
        maxX = 0;
        payoff = 0;
        for j=1:m
            if abs(ret(i)) <= xh(j,1) && xh(j,2) > 0
                payoff = payoff + xh(j,2);
                if maxX == 0
                    maxX = j;
                else
                    if xh(maxX,1) < xh(j,1)
                        maxX = j;
                    end
                end
            end
        end
        if maxX ~= 0
            xh(maxX,2)=0;
        end
        %payoff
        totalPayoff = totalPayoff + payoff*exp(-r*i);
    end
    v0=totalPayoff;
    end


