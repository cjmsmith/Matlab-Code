function MeshTriangle(x,y,L)
% x and y are 3-vectors.
% L is a nonnegative integer.
% Adds to the current figure window a level-L partitioning of the
%    triangle whose vertices are specified by the 3-vectors x and y.
% Assumes that hold is on.

if L==0
   % No subdivision required...
   fill(x,y,'y','linewidth',1.5)
   pause
else
   % A subdivision is called for...
   % Determine the side midpoints (a(1),b(1)), (a(2),b(2)), and (a(3),b(3))
   a = [(x(1)+x(2))/2 (x(2)+x(3))/2 (x(3)+x(1))/2];
   b = [(y(1)+y(2))/2 (y(2)+y(3))/2 (y(3)+y(1))/2];
   % Color the interior triangle magenta...
   fill(a,b,'m','linewidth',1.5)
   pause
   % Apply the process to the three "outer" triangles...
   MeshTriangle([x(1) a(1) a(3)],[y(1) b(1) b(3)],L-1)
   MeshTriangle([x(2) a(2) a(1)],[y(2) b(2) b(1)],L-1)
   MeshTriangle([x(3) a(3) a(2)],[y(3) b(3) b(2)],L-1)
end