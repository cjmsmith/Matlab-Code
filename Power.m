function y= Power(x, n)
% y = x^n where n is an integer >=0
if n==0

elseif rem(n,2)==0
    x=x^2;
    y=Power(x, n/2);
else
    x=x^3;
    y=Power(x,(n-1)/2);
end
