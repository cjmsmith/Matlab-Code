function [root, fRoot, xms] = rootByBisection(xL, xR, del, maxIt)

% Find a root using the Bisection method.
% Scalars xL and xR are the left and right end of the initial interval.
% Bisection continues until an interval width of del is reached, until the
% difference between the function value and zero is no bigger than del, or
% until maxIt is reached.
% Scalar root is the root found using the bisection method.
% Scalar fRoot is the function value at the found root..
% Vector xms stores the sequence of interval midpoints evaluated.
% The function whose root is sought is coded in fun.m

xms = linspace(1,1,maxIt);

%Check to make sure interval is valid
while (fun(xR)>0 && fun(xL)>0) || (fun(xR)<0 && fun(xL)<0) || (xL > xR)
    disp('Enter new values for xL and xR')
    xL=input('Enter xL:');
    xR=input ('Enter xR:');
end

m = (xR+xL)/2; %m is the midpoint of an interval
k = 1;         %k is the index
xms(k)= m;

while abs(xR-xL)>del && abs(fun(m))>del && k<maxIt
    m = (xR+xL)/2;
    k=k+1;
    xms(k)= m;
    if (fun(xR)>0 && fun(m)<0) || (fun(xR)<0 && fun(m)>0)
        xL=m;
    else
        xR=m;
    end
end

root=xms(k);
fRoot=fun(root);
disp(fRoot)
end