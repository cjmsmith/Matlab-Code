hold on

a=[0.1 0.25 0.5 1.0 5.0];

x=[.0072 .014 .0234 .0295 .0422]; %BLACK

y=[.0120 .0212 .0352 .0427 .0537]; %RED
z=[.0231 .0361 .0475 .0518 .0567]; %BLUE

for i=1:1:5
a(i)=1/(a(i));
x(i)=(1/x(i));
y(i)=(1/y(i));
z(i)=(1/z(i));
end

ylabel('1/v (L*min/mmol)')
xlabel('1/[s] (L/mmol)')
title('Lineweaver-Burke Plot for Different Inhibitor Concentrations')

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

hold off