function newIm = Interpolate2Dor3D(M)

[nr, nc, np]=size(M);
i=2*nr-1; j=2*nc-1; %i and j are the length and width of the new matrix
newIm=uint8(zeros(i,j)); 
newIm(((2*(1:nr)-1)),((2*(1:nc)-1)))= M; 

for u=1:np
for m= 2:2:j
    for n=1:i %fill in the zeros with the average of the two values
        t=newIm(n,m+1);                      %below and above
        s=newIm(n,m-1);
        newIm(n,m)=(t+s)/2;
    end
end

for n=2:2:i
    for m=1:j %fill in the zeros with the average of the two values
        t=newIm(n+1,m);                              %below and above
        s=newIm(n-1,m);
        newIm(n,m)=(t+s)/2;
    end
end        
end
end


        
    