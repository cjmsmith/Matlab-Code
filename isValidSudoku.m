function [a]=isValidSudoku(filledPuzzle)
% Checks to see if filledPuzzle is a valid sudoku solution
%Every row, column, and sub-grid must be valid, i.e. must contain only the
%integers 1, 2, 3, 4, 5, 6, 7, 8 and 9 with no repeating values.
%If it is, return value true. If not, return value false.

[nr,nc]=size(filledPuzzle);
if nr==9 && nc==9
    a=true;
else
    a=false;
end
if a
    d=true;     % checker variable
    r=1;
    while d && r<=9 %check to make sure each row is valid
        subarray=filledPuzzle(r,:);
        d=isValidPartition(subarray);
        if d
            r=r+1;
        else
            a=false;
        end
    end
    c=1;
    while d && c<=9 %check to make sure each column is valid
        subarray=filledPuzzle(:,c);
        d=isValidPartition(subarray);
        if d
            c=c+1;
        else
            a=false;
        end
    end
    s=1;
    while d && s<=9  %check to make sure each sub-grid is valid
        subarray=extractSubarray(s,filledPuzzle);    % subfunction
        d=isValidPartition(subarray);
        if d
            s=s+1;
        else
            a=false;
        end
    end
else
    a=false;
end
end

function [subarray]=extractSubarray(s,filledPuzzle)
%Takes a 3-by-3 submatrix out of matrix filledPuzzle
%Returns this value as subarray.
% rs and cs are row and column indices of subarrays

if s<=3
    rs=1;
    cs=(s-1)*3+1;
elseif s<=6
    rs=4;
    cs=(s-4)*3+1;
else
    rs=7;
    cs=(s-7)*3+1;
end 
subarray=[filledPuzzle(rs:rs+2,cs:cs+2)];  % vectorized code
end
