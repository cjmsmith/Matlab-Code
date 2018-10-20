function addWalls(x,y,w,h)

% Recursively partition the chamber of width w and height h using randomly
% placed vertical and horizontal walls with random openings until all
% chambers have at least one side with unit length.
% x, y, w, and h are each an integer; w and h are positive.
    
if w>1 && h>1  %Keep going unless the width or the height is equal to or 
    %lower than 1

% Divide into 4 chambers and create 3 openings

dx= myRandInt(x+1,w+x-1);     %adding and subtracting by 1 prevents (dx,dy)
dy= myRandInt(y+1,h+y-1);     %from being on a wall
plot([dx dx], [y h+y],'k','Linewidth',2)
plot([x x+w],[dy dy], 'k', 'Linewidth',2)

%Assign/Define 4 walls. 

wall={};
wall{1}= [x,dx]; wall{2}= [dx,w+x];
wall{3}= [y,dy]; wall{4}= [dy,h+y];

% Plot openings. The 3 sides are randomly chosen. The location of openings
% are randomly chosen

rwall= myRandInt(1,4);
for k=1:4
    if k~=rwall
        R= myRandInt(wall{k}(1), wall{k}(2)-1);
        if k==1 || k==2   % wall is parallel to x-axis
            plot([R R+1],[dy dy],'w','Linewidth',2)
        else              % wall is parallel to y-axis
            plot([dx dx],[R R+1],'w','Linewidth',2)
        end
    end
end

addWalls(x,y,dx-x,dy-y);         %Recursive
addWalls(dx,dy,w-(dx-x),h-(dy-y)); 
addWalls(x,dy,dx-x,h-(dy-y)); 
addWalls(dx,y,w-(dx-x),dy-y); 

end


