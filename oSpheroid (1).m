% Surface Area of an oblate sphereroid
r1= input ('Enter equatorial radius (kilometers) r1:');
r2 = input ('Enter polar radius (kilometers) r2: ');
y = acos(r2/r1);

% A(r1, r2)= Surface Area (SA)
SA = 2*pi*((r1^2)+(((r2^2)/(sin(y))*(log((cos(y)/(1-sin(y))))))));

% Surface Area Approximation (AP)
AP= 4*pi*(((r1+r2)/2)^2);

% Ellipicity of an oblate sphereroid (e)
e = sqrt(1-(r2^2)/(r1^2));
fprintf(' Surface Area: %10.3f kilometers\n ',SA)
fprintf(' Surface Area Approximation: %10.3f kilometers\n ', AP)
fprintf(' Ellipicity: %1.3f kilometers\n ', e)

