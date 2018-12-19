function x = optimalLayerSz(r, sigma, interval)
    cdfArea = @(x)(logncdf(x,r,sigma) - logncdf(-x,r,sigma));
    diff = @(x)(cdfArea(x)-interval);
    x = fzero(diff,0)-1;
    