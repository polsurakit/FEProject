function findOptimalsigma()

r = 0.05;
x = 0:0.001:0.2;
res = ones(length(x),1);
la = [0.03,0.05,0.07,0.09,0.11];
for i = 1:length(x)
    for j = 1:1
    y1 = logncdf(1 + la(j),r-0.5*x(i)^2, x(i)) - logncdf(1- la(j),r-0.5*x(i)^2, x(i));
    y2 = logncdf(1+la(end),r-0.5*x(i)^2, x(i)) - logncdf(1-la(end),r-0.5*x(i)^2, x(i));
%     y3 = logncdf(1+la(end),r-0.5*x(i)^2, x(i)) - logncdf(1 +la(j),r-0.5*x(i)^2, x(i));
    res(i) = res(i)*y1/(y2);
    end
end

% for i = 1:length(x)
%     y1 = logncdf(1 + 0.09,r-0.5*x(i)^2, x(i)) - logncdf(1- 0.09,r-0.5*x(i)^2, x(i));
%     y2 = logncdf(1+0.11,r-0.5*x(i)^2, x(i)) - logncdf(1-0.11,r-0.5*x(i)^2, x(i));
% %     y3 = logncdf(1+0.05,r-0.5*x(i)^2, x(i)) - logncdf(1 +0.03,r-0.5*x(i)^2, x(i));
%     res(i) = res(i)*y1;
% end
figure;
plot(x, res);
datacursormode on