% Script calcShadow
% Position a light source and a box in a room and determine the extent of
% the shadow cast by the box.

% Set up the window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis equal        % unit lengths on x- and y-axis are equal
axis([0 10 0 10]) % x-axis limits [0,10], y-axis limits [0,10]

% Top left corner of box, point T
xt=5;  yt=7;
plot(xt, yt, 'bo')           % Format Blue circle
plot([xt xt], [1 yt], 'k:')  % Format blacK dotted line
text(xt, yt, '  T')

%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%

% Light source, point L
xL=rand*5;  yL=7+rand*3;     % Random coordinates for L are generated
plot(xL, yL, 'r*')           % format Red asterisk
text(xL, yL, '  L')

% User-clicked point
title('Click on the dotted line below')
[xu, yu] = ginput(1);
plot(5, yu, 'm+')          % Format Magenta cross
text(5, yu, 'U')


%Draw a black solid line from point T to U
plot([xt 5], [yt yu ], 'k-')

%Draw a yellow solid line from point U to (10, yu)
plot([5 10], [yu yu], 'y-')

%Draw a green solid line from (10, yu) to (10, 7)
plot ([10 10], [yu 7], 'g-')

%Draw a cyan solid line from T to (10,7)
plot ([xt 10], [yt 7], 'c-')

%Draw a red dotted line from L to extent of shadow
m = (yL-yu)/(xL-5);   % m is the slope of the red dotted line
y = m*(10-xL)+yL;
plot([xL 10], [yL y], 'r:')

%Plot the shadow
plot([10 10], [y yu], 'b-', 'LineWidth', 3)
X = ((0-yL)/m)+xL;     % X is the x-coordinate when y = 0
if y<0 
    plot ([10, X], [0 0], 'b-', 'LineWidth', 3)
else
end

%Display coordinates of light source
messageToShow = sprintf('Light Source Coordinates are (%.1f,%.1f)', xL, yL);
title(messageToShow)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not change the code below %%%

hold off