function  T = Shuffle(S)
% S is 1-by-n cell array and n is even.
% T is 1-by-n cell array that is a perfect shuffle of S.

n = length(S); 
mid = n/2; 
T = cell(1,n);  Top=cell(1,mid);  Bot= cell(1,mid);

% Cut the deck
for k= 1:mid
    Top{k}= S{k};
    Bot{k}= S{mid+k};
end

% Alternate
for k= 1:mid
    T{2*k-1} = Top{k};
    T{2*k}   = Bot{k};
    endT(