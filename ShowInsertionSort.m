% Script ShowInsertionSort
clc
n= 10;
x= rand(n,1);
[y, TC, TS]= InsertionSort(x);
disp('Original  Sorted')
for k= 1:length(x)
    fprintf('%6.3f   %6.3f\n', x(k), y(k))
end

