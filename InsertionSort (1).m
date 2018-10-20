pofunction [x,TotalC,TotalS] = InsertionSort(x)
% Sort x in ascending order using insertion sort algorithm.
% x is a column n-vector.
% TotalC is the total number of required comparisons.
% TotalS is the total number of required swaps.

n = length(x); TotalC = 0; TotalS = 0;
for k = 2:n
    [x(1:k),C,S] = Insert(x(1:k));
    TotalC = TotalC + C;
    TotalS = TotalS + S;
end

function [x,C,S] = Insert(x)
% Pre:  x is a column m-vector with x(1:m-1) sorted.
% Post: x is sorted in assending order by applying the insert process.
% C is the number of required comparisions.
% S is the number of required swaps.
m = length(x); S = 0;
k = m-1;
while k>=1 && x(k)>x(k+1)
    t = x(k+1); 
    x(k+1) = x(k); 
    x(k) = t; 
    S = S+1;
    k = k-1;
end
if k==0
    C = S;
else
    C = S+1;
end



