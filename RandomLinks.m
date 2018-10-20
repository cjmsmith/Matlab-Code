function A = RandomLinks(n)
% n is a positive integer
% Generate an n-by-n array of 0's and 1's
% The probability that A(i,j) is one is zero if i==j
% and 1/(1 + |i-j|) otherwise

A = zeros(n,n);
for i=1:n
    for j=1:n
        r = rand(1);
        if i~=j &&  r <= 1/(1 + abs(i-j))
            A(i,j) = 1;
        end
    end
end
