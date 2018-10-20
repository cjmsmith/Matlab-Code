classdef Fraction < handle 
% A Fraction has a numerator (num) and a denominator (denom).
% A negative fraction has a negative numerator and a positive denominator. 
% If the denominator is zero, set the numerator to +/- inf and the
% denominator to 1.
% Assume numerator and denominator are integers (except for the case of inf).
    
    properties
        num    % numerator
        denom  % denominator
    end
    
    methods
        function frac = Fraction(nu, de)
        % Constructor: construct a Fraction object and return its handle
            if de<0   % need to make denominator positive
                nu= -nu;
                de= -de;
            end
            if de~=0  % normal fraction
                frac.num= nu;
                frac.denom= de;
            else      % denominator is zero
                if nu==0     % set fraction to NaN (Not a Number)
                    frac.num= NaN;
                elseif nu<0  % set fraction to -Inf
                    frac.num= -Inf;
                else         % set fraction to +Inf
                    frac.num= Inf;
                end                
                frac.denom= 1;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % For submission on Cody Coursework, DO NOT uncomment the
            % statement below.  For testing within MATLAB, you can
            % uncomment the statement below if function reduce is 
            % implemented:
            %   frac.reduce()
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
        
        function tf = isLessThan(self, other)
        % tf is true if self is strictly less than the other Fraction
            tf= self.num*other.denom < other.num*self.denom;
        end
        
        function tf = isEqualTo(self, other)
        % tf is true if self is equal to the other Fraction; otherwise false.
        % Assume self and other are not NaN.
            %%%% write your code below %%%%
            if (self.num>0 && other.num>0) || (self.num<0 && other.num<0)
                if rem((self.num/self.denom),(other.num/other.denom))==0
                    tf=true;
                else
                    tf=false;
                end
            else
                tf=false;
            end
        end
        
        function out = add(self, other)
        % out is a new Fraction from adding self and the other Fraction
            %%%% write your code below %%%%
            if self.denom==other.denom
                out=(self.num+other.num)/other.denom;
            else
                d=self.denom*other.denom;
                i=self.num*other.denom;
                j=other.num*self.denom;
                out=Fraction((i+j),d);
            end
            
        end
        
        function val = toDouble(self)
        % val is the type double value of self
            %%%% write your code below %%%%
            n=double(self.num);
            d=double(self.denom);
            val=n/d;
            
        end
        
        function reduce(self)
        % Reduce self (e.g., 14/6 --> 7/3)
            %%%% write your code below %%%%
            if self.num==0 || isinf(self.num)==1|| isnan(self.num)==1
                self.denom=1;
            else
                if self.num<=self.denom
                    a=self.num;
                    b=self.denom;
                else
                    b=self.num;
                    a=self.denom;
                end
                while rem(b,a)~=0
                    trans=a;
                    a=rem(b,a);
                    b=trans;
                end
                if self.num>0
                    self.denom=self.denom/a;
                    self.num=self.num/a;
                else
                    self.denom=abs(self.denom/a);
                    self.num=0-abs(self.num/a);
                end
            end
        end
        
%         function disp(self)
%         % Display self, a Fraction, in this format: numerator/denominator
%             if isempty(self)
%                 fprintf('Empty %s\n', class(self))
%             else
%                 fprintf('%d/%d\n', self.num, self.denom)
%             end
%         end
        
    end %methods
    
end %classdef

