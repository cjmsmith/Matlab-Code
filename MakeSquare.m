function S = Rightmost(SA)
% SA is an array of square structs. S is the struct in SA with a right
% edge that is furthest to the right.
% If multiple squares have the same max right side, S can be any one of
% them.


function SA = SquareArray(n)
% SA is an array of n square structs such that for each square, the side
% length and the x- and y-coordinates of the lower-left corner are each
% uniformly random in the interval (0,1). Make effective use of MakeSquare





function Sqr = MakeSquare(x, y, L)
% Sqr is a square with
% Sqr.x (x-coordinate of lower left corner) assigned x
% Sqr.y (y-coordinate of lower left corner) assigned y
% Sqr.side assigned L (the side length)
Sqr=struct('x',x,'y',y,'L',L);