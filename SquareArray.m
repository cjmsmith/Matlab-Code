function SA = SquareArray(n)
% SA is an array of n square structs such that for each square, the side
% length and the x- and y-coordinates of the lower-left corner are each
% uniformly random in the interval (0,1). Make effective use of MakeSquar

SA=[];
for i=1:n
    x=rand;
    y=rand;
    L=rand;
    Sqr=MakeSquare(x,y,L);
    SA=[SA Sqr];
end


function Sqr = MakeSquare(x, y, L)
% Sqr is a square with
% Sqr.x (x-coordinate of lower left corner) assigned x
% Sqr.y (y-coordinate of lower left corner) assigned y
% Sqr.side assigned L (the side length)
Sqr=struct('x',x,'y',y,'L',L);
end
end