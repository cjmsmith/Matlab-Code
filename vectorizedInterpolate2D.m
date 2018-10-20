function newM = vectorizedInterpolate2D(M)
[nr, nc]=size(M);
i=2*nr-1; j=2*nc-1;
newM=(zeros(i,j));
newM(((2*(1:nr)-1)),((2*(1:nc)-1)))= M;

for n= 2:2:j
    for m=1:i
        t=newM(n-1,m);
        s=newM(n+1,m);
        newM(n,m)=(t+s)/2;
    end
end

for n=1:j
    for m=2:2:i
        t=newM(n,m-1);
        s=newM(n,m+1);
        newM(n,m)=(t+s)/2;
    end
end
        
        
        
        
end


        
    