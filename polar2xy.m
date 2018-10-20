function [x, y] = polar2xy(r,theta)
% (x,y) are the Cartesian coordinates of polar coordinate r theta.
% theta is in degrees.

rads= theta*pi/180;  % radian
x= r*cos(rads);
y= r*sin(rads);

function [