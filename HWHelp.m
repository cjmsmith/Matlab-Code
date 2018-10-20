hold on
x=[0.0192 0.0333 0.1019 0.1360 0.1640 0.1799 0.1847 0.1847 0.1888 0.19010];

y=[0.0107 0.0185 0.0667 0.0982 0.1401 0.1620 0.1721 0.1776 0.1830 0.1832];

z=[0.0096 0.0157 0.0464 0.0613 0.0760 0.0827 0.0851 0.0864 0.0877 0.0884];

a=[0.005 0.01 0.05 0.1 0.25 0.5 0.75 1 1.5 2];


%vmaxX=0.19; kmX=0.043; ux=kmX/vmaxX;
%vmaxY=0.185; kmY=0.09; uy=kmY/vmaxY;
vmaxZ=0.09; kmZ=0.05; uz=kmZ/vmaxZ;



plot(a,x,'k*') %1/2vmax=0.095 km= 0.043 vmax=0.19
plot(a,y,'r*') %vmax= .185 1/2vmax = .0925 km=0.09
plot(a,z,'b*') %vmax=0.090 1/2vmax=0.045 km=0.05


Fit = polyfit(a,x,1);
INTercept=Fit(2);
disp(INTercept);
f=(polyval(Fit,a));
plot(a,f,'k');

Fit = polyfit(a,y,1);
INTercept=Fit(2);
disp(INTercept);
f=(polyval(Fit,a));
plot(a,f,'r')

Fit = polyfit(a,z,1);
INTercept=Fit(2);
disp(INTercept);
f=(polyval(Fit,a));
plot(a,f,'b');


ylabel('1/v (L*min/mmol)')
xlabel('1/[s] (L/mmol)')
title('Lineweaver-Burk Plot of Previous Data')
hold off
