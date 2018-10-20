%function m=factorial(n)

%if n==0
    %m=1;
%else
   % m=n*factorial(n-1);
%end

%function y=Power(x,n)
 %   y=1;
%elseif rem(n,2)==0
 %   y=x*Power(x,n/2);
%else
 %   y=x*Power(x,(n-1/2));
%end
%end

%function factorial(v)
%max=-1; n=length(v);
%for i=1:n
 %   if v(i)>max
  %      max=v(i);
   % end
%end
%scalefactor=10/max;
%for i=1:n
 %   x='';
  %  nofAstriks=round(v(i)*scalefactor);
   % for j=1:nofAstriks
    %    x(j)='*';
    %end
    %disp(x)
%end
%end

%%function n=factorial(s)
%if length(s)==1
 %   n=1;
%else
 %   r=length(s);
  %  n= 2*factorial(s(1:r-1))+s(r);
%end, 
%end

%function factorial(a,b,base,height,L)
%if L==0
 %   x=[a a base+a base+a];
  %  y=[b b+height b+height b];
   % fill(x,y,'k');
%else
%if a+base>b+height
 %   x=[a a+height a+height a];y=[b b b+height b+height];
  %  u=['b' 'y' 'g' 'r' 'm'];
   % i=ceil(rand*5);
    %fill(x,y,u(i));
  %  factorial(a+height,b+height,base-(a+height),height,L-1);
%else
 %   x=[a a+base a+base a];y=[b b b+base b+base];
  %  u=['b' 'y' 'g' 'r' 'm'];
   % i=ceil(rand*5);
    %fill(x,y,u(i));
    %factorial(a+base,b+base,base,height-(b+base),L-1);

%end
%end
%hold off
%end
    
%function x=factorial(x)
%insertion sort
%n=length(x);
%j=1;
%while j<n
 %   i=j;
  %  while i>0 && x(i+1)<x(i)
   %     t=x(i);
    %    x(i)=x(i+1);
     %   x(i+1)=t;
      %  i=i-1;
    %end
     %  j=j+1;
%end
%end
        
    
%function y=factorial(x)
%merge sort
%if length(x)==1
 %   y=x;
%else
 %   m=floor(length(x)/2);
  %  yL=factorial(x(1:m));
   % yR=factorial(x(m+1:length(x)));
   % y=Merge(yL,yR);
%end

%function z=Merge(yL,yR)
%assume yL and yR are sorted
%nL=length(yL); nR=length(yR); Z=nR+nL;
%iL=1; iR=1; iZ=1; z=zeros(1,Z);
%while iL<=nL && iR<=nR
 %   if yL(iL)<yR(iR)
  %      z(iZ)=yL(iL);
   %     iL=iL+1;
    %else
     %   z(iZ)=yR(iR);
      %  iR=iR+1;
      %end
    %iZ=iZ+1;
%end
%if iL>nL
 %   while iR<=nR
  %   z(iZ)=yR(iR);
   %  iR=iR+1;
    % iZ=iZ+1;
    %end
%elseif iR>nR
 %   while iL<=nL
  %   z(iZ)=yL(iL);
   %  iL=iL+1;
    % iZ=iZ+1;
    %nd
%end
%end
%end
    
    



