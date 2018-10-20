function newIm = interpolate3D(P)
[nr,nc,np]=size(P);
%fprintf('nr=%d, nc=%d, np=%d\n',nr,nc,np)
i=2*nr-1; j=2*nc-1; %i and j are the length and width of the new matrix
newIm=uint8(zeros(i,j,np)); 

% Plug original values into larger matrix newIm, which will be interpolated
newIm((2*(1:nr)-1),(2*(1:nc)-1),:)= P;    % vectorized code

for p=1:np
    % Interpolate non-zero rows
    for n= 2:2:j 
        for m=1:2:i
            t=newIm(m,n-1,p);
            s=newIm(m,n+1,p);
            newIm(m,n,p)=(t+s)/2;
        end
    end
    % Interpolate the zero rows, using the row above and the row below  
    for m=2:2:i
        for n=1:2:j
            t=newIm(m-1,n,p);
            s=newIm(m+1,n,p);
            newIm(m,n,p)=(t+s)/2;
        end
    end
    
    for m=2:2:i
        for n=2:2:j
            t=newIm(m-1,n,p);
            s=newIm(m+1,n,p);
            newIm(m,n,p)=(t+s)/2;
        end
    end
end
end
