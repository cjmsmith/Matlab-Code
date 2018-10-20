function points = diceGame(nTrials)
% Simulate the rolling of three Dies (dice) nTrials times, nTrials>1.
% In each trial, earn 1 point if at least two dice show the same face.
% points: the total number of points earned.

nD= 3;       % number of dice
points= 0;   % number of points earned so far

for k= 1:nD
   d(k)= Die(6);  % 6-sided die
end

for t= 1:nTrials

    % Roll the dice 
    for k= 1:nD
        %Roll kth die
        d(k).roll()
        fprintf('%d ', d(k).getTop)
    end
    
    % Win 1 point if at least two dice show the same face
    if d(1).getTop==d(2).getTop || d(2).getTop==d(3).getTop || d(1).getTop==d(3).getTop 
        points= points + 1;
    end
    fprintf('  Points so far: %d\n', points)

end