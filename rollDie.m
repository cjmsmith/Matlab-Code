function count= rollDie(d,n)
% Simulate rolling of a fair 6-sided die
% Usage:  count = rollDice(rolls)
%   d is the number of faces of the die
%   n is the number of times to roll die
%   COUNT is vector of how many times each outcome occurs
%     count(f) is the number of times face f occurs

FACES= d;               % number of faces on die
count= zeros(1,d);  % bins to store counts

% Count outcomes of rolling a FAIR die
for k=1:n
    % roll the die
    face= ceil(rand*FACES);
    % increment appropriate bin
    count(face)= count(face) + 1;
end

% Show histogram of outcome
bar(1:FACES, count);
title(sprintf('Outcomes from %d rolls of a fair die', rolls), 'Fontsize',14);
xlabel('Outcome', 'Fontsize',14);  ylabel('Count', 'Fontsize',14);
shg
