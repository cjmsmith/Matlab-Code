% Largest triangle given n points on a unit circle
% Writing efficient code

% Part 1
  for n=100:50:200
      theta = rand(n,1)*2*pi;  % Angle of n random pts on the unit circle
      % Compute the area of the largest triangle that can be formed by
      % 3 of the n points
      A = 0;  % max area so far
      for i=1:n
          for j=1:n
              for k=1:n
                  % Triangle with vertices at points i,j,k
                  % Calculate Cartesian coordinates
                  c1 = cos(theta(i));
                  s1 = sin(theta(i));
                  c2 = cos(theta(j));
                  s2 = sin(theta(j));
                  c3 = cos(theta(k));
                  s3 = sin(theta(k));
                  % Area using Heron's Formula where a,b,c are side lengths
                  % of the triangle
                  a = sqrt((c1-c2)^2 + (s1-s2)^2);  % distance btw points i,j
                  b = sqrt((c1-c3)^2 + (s1-s3)^2);  % distance btw points i,k
                  c = sqrt((c2-c3)^2 + (s2-s3)^2);  % distance btw points j,k
                  s = (a+b+c)/2;
                  Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
                  A = max(A,Aijk);
              end
          end
      end
  end
  
% Part 2


% Part 3


% Part 4