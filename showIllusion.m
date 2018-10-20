% Draw three Munker-White Illusions:  the left two are strong; the right 
% one is weak.

close all

% Set figure window to be 95% of screen width and 90% to screen height
scrsz = get(0,'ScreenSize');
figure('OuterPosition',[1 .1*scrsz(4) .95*scrsz(3) .9*scrsz(4)])
axis equal off

%------------------------------------------------------------
% Do not change the code above.
% Write your code below to draw three Munker-White Illusions.
%------------------------------------------------------------

% Example 1: Strong illusion
n=8;         %Number of grid rectangles
w1=20;       %Width of grid rectangles (horizontal length)
f=.25;       %Fraction between 0 and 0.5 %f*w is width of narrow rectangles
a=0;         %x-coordinate
b=0;         %y-coordinate
cg= [0 0 0]; %Color of grid rectangles %black
cs= [0 0 1]; %Color of narrow rectangles %blue
mwIllusion(n, w1, cg, cs, f, a, b) %Plots illusion

% Example 2: Strong illusion
n=10;
w2=15;
f=.25;
a=a+w1+3;
b=0;
cg=[1 0 0];  %red
cs= [1 1 0]; %yellow
mwIllusion(n, w2, cg, cs, f, a, b)

% Example 3: Weak illusion
n=6;
w=18;
f=.25;
a=a+w2+3;
b=0;
cg= [0 1 1]; %cyan
cs= [0 0 1]; %blue
mwIllusion(n,w,cg,cs,f,a,b)

