function sequence(m)
k=1; %vector length so far

num=ceil(rand*m);
while num~= m(k) %while num is not equal to a value already in vector m
        num = ceil(rand*m);
        k=k+1;
        m(k)=num;
end
fprintf('%3.0f', m)
end

