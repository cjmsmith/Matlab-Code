function [colrZ, colrSorted] = rectangles(Z,xmax,ymax,colorS,colorL)
% Draw the rectangles in struct array Z:
% Figure 1 draws the rectangles in the order Z(1), Z(2), ..., Z(n), where n
%   is the length of Z. Draw all rectangles in one color of your choice.
% Figure 2 draws the rectangles starting from the largest (by area) to the
%   smallest. The colors of the rectangles are linearly interpolated with
%   the largest area corresponding to colorL and the smallest area
%   corresponding to colorS.
% xmax and ymax are the upper limits of the x- and y-axes in the figures.
%   The lower limit of the x- and y-axes is 0.
% colrZ is the n-by-3 matrix where colrZ(k,:) are the rgb values of Z(k).
% colrSorted is the n-by-3 matrix where colrSorted(i,:) are the rgb values
%   of the ith smallest rectangle.
close all
n= length(Z);

% Figure 1
figure
axis equal
axis([0 xmax 0 ymax])
hold on

for k = 1:n
    ShowRect(Z(k),'m')      % subfunction
end
hold off
pause(.5)

% Figure 2
figure
axis equal
axis([0 xmax 0 ymax])
hold on

% Calculate areas and store in vector A
A= zeros(1,n);
for k = 1:n
    A(k)= (Z(k).right - Z(k).left)*(Z(k).top - Z(k).bot);
end

colrSorted= zeros(n,3); colrZ= zeros(n,3);
[y,idx]=sort(A);
for i = n:-1:1
    f= i/n;
    c= f*colorL + (1-f)*colorS;
    ithsmallest= idx(i);
    ShowRect(Z(ithsmallest),c)       % idx(j) is equal to k
    colrSorted(i,:)= c;
    colrZ(ithsmallest,:)= c;
end

w='{\color[rgb]{';
x=num2str(colorL);
y=num2str(colorS);
z='}Biggest \color[rgb]{';
a='}Smallest}';
b=[w x z y a];
title(b)
%title(xmax/3,ymax,'Biggest','Color',colorL,'Fontsize',20;xmax/3+9,ymax,'Smallest','Color',colorS,'Fontsize',20);
%text(xmax/3,ymax,'Biggest','Color',colorL,'Fontsize',20);
%text(xmax/3+9,ymax,'Smallest','Color',colorS,'Fontsize',20);
hold off
end

function ShowRect(R,s)
% R is rectangle
% s is one of the characters 'k','w','r','g','b','m','c','y'
% Displays R in the current figure window using the color s
% Assumes hold is on

fill([R.left R.right R.right R.left],[R.bot R.bot R.top R.top],s)
plot([R.left R.right R.right R.left R.left],...
     [R.bot R.bot R.top R.top R.bot], 'k','Linewidth',2)
end