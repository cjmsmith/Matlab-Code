function newM = vectorizedInterpolate2D(M)
[nr, nc]=size(M);
newM=zeros(2*nr-1, 2*nc-1);
newM(((2*(1:nr)-1)+1),((2*(1:nc)-1)+1))= M;
end