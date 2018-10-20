%Calculate and display values x1, x2, x3, x4
%Do this by dividing matrix A by column vector b

k1=100; %Spring constants
k2=50;
k3=75;
k4=200;

A=[-k1-k2   k2       0        0;...    %coefficiants of x1(column 1),x2(2),  
    k2     -k3-k2    k3       0;...    %x3(3), and x4(4)for equations 1
    0       k3      -k4-k3    k4;...   %(row 1), 2, 3 and 4.
    0       0       -k4       k4];
    
b=[0 0 0 2000]'; %values of b are the constants for each equation
x=A\b; %calculate x1 through x4
disp(x)
