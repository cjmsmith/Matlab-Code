function [c, sd]= MyShuffle(d)
% d is a one-dimensional cell array representing a deck of cards.
% sd is the cell array after shuffling d.
% c is the "cut point," explained below.
% The shuffle comprises two steps:
% - Cut the deck into two parts: generate a random integer value such
% that it is equally likely to be in [15..38]. This value is c, the
% first return parameter. The Top subdeck gets the cards at positions
% 1 to c of the original deck; the Bot subdeck gets the cards at
% positions c+1 to n of the original deck.
% - Interleave the cards from Top and Bot subdecks in this order:
% Top{1}, Bot{1}, Top{2}, Bot{2}, ..., Top{m}, Bot{m}, where m is the
% smaller value between c and 52-c. (I.e., interleave the cards from
% the two subdecks until the smaller subdeck has been completely
% incorporated.) Then put any remaining cards (from the larger subdeck)
% at the end of the shuffled deck.
c=rand*23+15;

