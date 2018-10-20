function showSteps(xb, xp, t)
% Plot the progress of root finding by bisection and random partition.
% Vector xb is the sequence of midpoints evaluated during the bisection
% algorithm.
% Vector xp is the sequence of points evaluated using the random partition
% method.
% t is the pause time, for animation. t>=0 seconds.
% The function whose root is sought is coded in fun.m

close all
figure

subplot(1,2,1)
hold on
title('Progression of bisection method')
n= length(xb);
for k= 1:n-1
    plot(xb(k), fun(xb(k)), 'b.')
    pause(t)
end
plot(xb(n), fun(xb(n)), 'r*')
xlabel('x')
ylabel('f(x)')
grid on
hold off

subplot(1,2,2)
hold on
title('Progression of partition method')
n= length(xp);
for k= 1:n-1
    plot(xp(k), fun(xp(k)), 'b.')
    pause(t)
end
plot(xp(n), fun(xp(n)), 'r*')
xlabel('x')
ylabel('f(x)')
grid on
hold off