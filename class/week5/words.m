% words.mat contains word counts from articles. The left most col
% represents the category of the articles that scanned.

%-------------------------------------------------------------------------
% F for feminism, E for entertainment, and H for household
%-------------------------------------------------------------------------
%     Articles    drink    equal    fuel    play    popular    price    relief    talent    tax    woman
%     ________    _____    _____    ____    ____    _______    _____    ______    ______    ___    _____
% 
%     'F1'        1        2        0       1       2          0        0         0         0      2    
%     'F2'        0        0        0       1       0          1        0         2         0      2    
%     'F3'        0        2        0       0       0          0        0         1         0      2    
%     ...
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Question: When you get a new word counts x, what is the probability 
%           of each category based on the existing database?
%
%           In another words, what is p(x|F),p(x|E) and p(x|H) 
%           in above example?
%
% Let's say U=F(x) where U is the probability and x is the input, and 
% F is the rule to compute the result based on the existing database.
%
% Rules:
%   (i)   Econometric structural model
%   (ii)  Hidden Markov chain
%   (iii) Bayes network
%   (iv)  Neural network
%   (v)   Decision tree
% See rules-summary.png for more details from those slides.
%-------------------------------------------------------------------------











