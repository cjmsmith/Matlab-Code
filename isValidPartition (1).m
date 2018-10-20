function [a]=isValidPartition(subarray)
% Check that the subarray has nonrepeating values in the range [1,9]

% Convert 3x3 arrays into vectors by concatenation
[nr,nc]=size(subarray);
if nr==3 && nc==3
    subarray=concatenate(subarray);  % concatenate is a subfunction
end

% Check dimensions of subarray
if length(subarray)==9
    a=true;
    if a
        a=inRange(subarray);
        if a
            a=checkrepeat(subarray);
        end
    end
else
    a=false;
end
end

function [v]=concatenate(subarray)
    % if subarray is a 3x3 matrix, convert it into a vector
    v=[subarray(1,:) subarray(2,:) subarray(3,:)];
end

function [a]=inRange(subarray)
% Check if elements of subarray are in range [1,9] 
a=true;
k=1;
while a && k<=9
    if subarray(k)<1 || subarray(k)>9
        a=false;
    else
        k=k+1;
    end
end
end

function [a]=checkrepeat(subarray)
% Check for no repeats in subarray
% Initialize
a=true;
k=1;
while a && k<=8         % k is index of the subarray vector
    c=k+1;
    while a && c<=9
        if subarray(c)==subarray(k)
            a=false;
        else
            c=c+1;
        end
    end
    k=k+1;
end
end
    