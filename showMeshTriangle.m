% showMeshTriangle
% Demonstrate MeshTriangle -- recursion

close all
figure
axis equal off
axis([-.1 3.1 -.1 2.1])
hold on

% Show the vertices of the triangle
x= [0 3 1];
y= [0 0 2];
plot(x,y,'ko')
pause

% Draw the level L partition of the triangle
L= 3;
MeshTriangle(x,y,L)