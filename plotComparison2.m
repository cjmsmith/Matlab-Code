% Plot a function two different ways:
%   - one point at a time
%   - using vectors of x and y values

close all  % close all opened figure windows

figure  % figure 1
hold on
% Plot one point at a time without storing all values in vectors
for x=  -2:.01:3
    y= sin(5*x)*exp(-x/2)/(1+x^2);
    plot(x,y,'.')
end
hold off

figure  % figure 2
% Plot using vectors of x and y values
v= linspace(-2,3,501);
w= zeros(1, length(v));
for k=  1:length(v)
    w(k)= sin(5*v(k))*exp(-v(k)/2)/(1+v(k)^2);
end
plot(v,w,'.')
