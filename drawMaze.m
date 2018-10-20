% drawMaze
% Draw a random maze using recursion

close all
figure
axis equal off
hold on
set(gcf,'color','w')  % Set figure background color to white (instead of 
                      % gray--nice for printing a hardcopy)

x= 0;   % x-coord of lower left corner of chamber
y= 0;   % y-coord of lower left corner of chamber
w= 24;   % width of chamber
h= 16;  % height of chamber

% Maze area is white (and has black border)...
fill([x x+w x+w x],[y y y+h y+h],'w','Linewidth',2)

% Put two openings on the border (entrance and exit)...
plot([x x],[y y+1],'w','Linewidth',2)
plot([x+w-1 x+w],[y+h y+h],'w','Linewidth',2)

% Generate a maze...
addWalls(x,y,w,h)

hold off