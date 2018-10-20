function n = myRandInt(a,b)
% n is a random integer in the set [a..b] where a and b are integers and 
% a<=b

n= floor(rand*(b-a+1))+a;