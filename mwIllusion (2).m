function mwIllusion(n, w, cg, cs, f, a, b)
% Display the Munker-White Illusion in the current figure window.

% Parameters:
    % n: number of grid rectangles, i.e., the long rectangles that span the
        % width of the diagram. An integer value greater than 1.
    % w: width of the grid rectangles (horizontal length)
    % cg: color of the grid rectangles. A predefined color name such as ’k’,
    % ’b’, ..., etc, or an rgb vector.
    % cs: color of the two "stacks" of narrow rectangles. A predefined color
    % name or an rgb vector.
    % f: a fraction greater than 0 and less than 0.5. The horizontal width
    % of the narrow rectangles is f*w.
    % a,b: The x- and y-coordinates of the lower left corner of the diagram
% There are n-1 narrow rectangles in each stack, and the two stacks are
% horizontally centered in the diagram, with the same amount of space left
% of the left stack, between the stacks, and right of the right stack.
% Check parameter f: if f>=.5, set f to .3
% Set up graphics window

hold on  
% hold all calls to plot on current axes

H=1;%Height of Rectangles for DrawRectNoLine
L=w;%Length of Rectangles for DrawRectNoLine

for k=1:n %Code the grid rectangles
    b=b+(2*H);
    DrawRectNoLine(a,b,L,H,cg)
end

b=1; 
a=a+w/10;
for j=1:n-1 %Code the first column of narrow rectangles
    b=b+(2*H);
    L=f*w;
    DrawRectNoLine (a,b,L,H,cs)
end

b=0;
a=a-(w/10)+(w-(w/10)-(f*w));
for j=1:n-1 %Code the second column of narrow rectangles
    b=b+(2*H);
    L=f*w;
    DrawRectNoLine (a,b,L,H,cs)
end
hold off
end



    

   
