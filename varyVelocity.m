%Preform a sensitivity analysis of a rocket flight model
%Calculate a rocket's trajectory at four different exhaust times u
%Plot height of the rocket vs. time


mR = 100;           %rocket's mass w/out fuel in slugs
q = 1;              %rocket's burn rate in slug/seconds
b = 80;             %rocket's burn rate in seconds         
g = 32.2;           %acceleration in feet/seconds^2 
m0=mR+(q*100);      %rocket mass without fuel


close all
figure
hold on

for u=7000:500:8500 % loop over the different values of exhaust time u
       
     vb = u*log(m0/(m0-(q*b)))-(g*b); %velocity at burn time
     hb = (u/q)*(m0-q*b)*log(m0-q*b)+u*(log(m0)+1)*b-(g*b^2)/2-((u*m0)/q)*log(m0); 
     %height at burn time
     hp= hb+((vb^2)/(g*2)); %peak height    
     tp= b+vb/g;            %time rocket reaches peak high 
     tf= tp+sqrt(2*hp/g);   %time rocket hits ground
     T=linspace(0,tf,100);  %store values of time,height in vectors T,H.
     H=zeros(100);
     
     for k=1:100 %calculate height ht of rocket throughout flight time.
         t=T(k);
         if t<=b
            ht = (u/q)*(m0-(q*t))*log(m0-(q*t))+u*(log(m0)+1)*t-((g*t^2)/2)-((u*m0)/q)*log(m0);
            H(k)=ht;
         else    
            vt = u*log(m0/(m0-(q*t)))-(g*t); %velocity of rocket at t
            ht = hb+(vb*(t-b))-((g*((t-b)^2))/2);
            H(k)=ht;
         end
     end
     plot(T,H)
end

% Plot the curve
legend('u=7000ft/s', 'u=7500ft/s', 'u=8000ft/s', 'u=8500ft/s')
xlabel('Time(seconds)')
ylabel('Height(feet)')
title('Rocket Height vs Time')
hold off