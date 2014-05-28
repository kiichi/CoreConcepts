%-------------------------------------------------------------------------
% Frequency of Words Appearing in various articles
%-------------------------------------------------------------------------
% words.mat contains word counts from articles. The left most column
% represents the category of the articles that have been scanned.
% F for feminism, E for entertainment, and H for household
%-------------------------------------------------------------------------
%     Articles    drink    equal    fuel    play    popular    price    relief    talent    tax    woman
%     ________    _____    _____    ____    ____    _______    _____    ______    ______    ___    _____
% 
%     'F1'        1        2        0       1       2          0        0         0         0      2    
%     'F2'        0        0        0       1       0          1        0         2         0      2    
%     'F3'        0        2        0       0       0          0        0         1         0      2    
%     'F4'        2        1        0       0       0          2        0         2         0      1    
%     'E1'        2        0        1       2       2          0        0         1         0      0    
%     'E2'        0        1        0       3       2          1        2         0         0      0    
%     'E3'        1        0        2       0       1          1        0         3         1      1    
%     'E4'        0        1        0       1       1          0        1         1         0      0    
%     'H1'        0        0        2       0       1          2        0         0         2      0    
%     'H2'        1        0        2       2       0          2        2         0         0      0    
%     'H3'        0        0        1       1       2          1        1         0         2      0    
%     'H4'        0        0        1       0       0          2        2         0         2      0  
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


%-------------------------------------------------------------------------
% Now, I have unknown category of scanned word counts result unknown.mat.
% What is the probability for each category of this input?
%
%     drink    equal    fuel    play    popular    price    relief    talent    tax    woman
%     _____    _____    ____    ____    _______    _____    ______    ______    ___    _____
%     0        1        2       2       1          0        2         0         2      0    
%
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Bayes Theorem
%-------------------------------------------------------------------------
% Solve this using Bayes Theorem.
% These equations are propotional:
%   P(F|x)=p(x|F)p(F)
%   P(E|x)=p(x|E)p(E)
%   P(H|x)=p(x|H)p(H)
%
% So what is the x to maximize them? That's the solution using Bayes
% Theorem.
% 
% Let's look at by individual keywords, k.
%
% 1. Compute P(k)
% 2. Compute P(x|k)
% 3. In P(k|x)=P(k)P(x|k), find x which P(k|x) is maximum.
%
% Tips: However, the product, P(k) * P(x|k) could be too small. 
% Take log for both side just for heck of it so that we deal with
% some kind of reasonable numbers.
%
% Therefore, if you take log, the product becomes addition.
%
% LP(k|x)=log(P(k))+LP(x|k)  ... (NOTE: LP is log version of P)
% 
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Bag of Words
%-------------------------------------------------------------------------
% Bag of words is a way to count words by each category and add 1 to it.
% Let's look at Feminism (F) category counts
%
% drink    equal    fuel    play    popular    price    relief    talent    tax    woman
% _____    _____    ____    ____    _______    _____    ______    ______    ___    _____
% 3        5        0       2       2          3        0         5         0      7
%
% The sum of those counts is 27.
% When you calculate each keyword's probability, add 1 to avoid 0.
% Therefore, each probability goes like this:
% p(drink)=(1+3)/(10+27), p(equal)=(1+5)/(10+27), p(fuel)=(1+0)/(10+27), ...
%
% p = (1+count) / (10 + sum)
%
% Compute the probability based on the bag of words model.
%
%   drink	equal	fuel	play	popular	price	relief	talent	tax     woman
% F	0.108	0.162	0.027	0.081	0.081	0.108	0.027	0.162	0.027	0.216
% E	0.095	0.071	0.095	0.167	0.167	0.071	0.095	0.143	0.048	0.048
% H	0.049	0.024	0.171	0.098	0.098	0.195	0.146	0.024	0.171	0.024
%
% Multiply 100 and take Natural Log of Bag of Words Probability	
% p2 = ln(100 * p1)	use log() in matlab
%
%   drink	equal	fuel	play	popular	price	relief	talent	tax     woman
% F	2.381	2.786	0.994	2.093	2.093	2.381	0.994	2.786	0.994	3.074
% E	2.254	1.966	2.254	2.813	2.813	1.966	2.254	2.659	1.561	1.561
% H	1.585	0.892	2.838	2.278	2.278	2.971	2.683	0.892	2.838	0.892
%
%
% Looking into our new input which is in unknown (x) 
%     drink    equal    fuel    play    popular    price    relief    talent    tax    woman
%     _____    _____    ____    ____    _______    _____    ______    ______    ___    _____
%     0        1        2       2       1          0        2         0         2      0    
%
% Multiply x for each category                                                      
% F	0.000	2.786	1.989	4.186	2.093	0.000	1.989	0.000	1.989	0.000	
% E	0.000	1.966	4.508	5.627	2.813	0.000	4.508	0.000	3.121	0.000	
% H	0.000	0.892	5.675	4.556	2.278	0.000	5.367	0.000	5.675	0.000	
%
% Finally, there are 3 classes so the class probability is
% C (Class Probability) = log(100 * occurance / number of class)
% C=log(100*4/12)=3.5066 -- note: this is natural log ln
% ... and add 3.5066 to each results.
%
% Estimate the final decision. For example, feminism overall result (AF):
%
% AF = C + p(F1)*x1 + p(F2)*x2 + p(F3)*x3 + p(F4)*x4 + ?
%
% AF = 3.5066 + 0*0 + 1*2.786 + 2*1.989 + ...
% Calculate AE and AH in same way.
%
% Final Results (Decision) for unknown input x	
% AF	18.537
% AE	26.049
% AH	27.949
%
% See bag-of-words-in-excel.png











