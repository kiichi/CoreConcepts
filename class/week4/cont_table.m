%=========================================================================
% Part 1: Contingency Table and Conditional Probability
%=========================================================================

% Note: semi-colon at the end of line means suppress console out

%Import iris.mat - random generated iris
% There are 150 total items.
total = length(iris.SL);

% Build contengency table

% hist_sepal_length.png
hist(iris.SL,30);

% I'll break up the population into 4 groups 
% based on how it looks like in the histogram.
% see boundly.png
boundly=[4 5.3 5.9 7 8];
% Groups:
%   - G1: 4 - 5.3
%   - G2: 5.3 = 5.9
%   - G3: 5.9 - 7
%   - G4: 7 - 8

% Now, let's also group & count by taxon. Without Sepal Length
% The total count per taxon goes like this...
% t1c=length(find(strncmp(iris.Taxon,'I.setosa',length('I.setosa'))))

% Taxon T1 - T3
tx={'I.setosa','I.versicolor','I.virginica'};

% Now, let's count how many values 
% in the each boundly-group (G) per Taxon(T)

% G1, G2, G3 and G4
for m=1:4;    
    found_idx = find(iris.SL>=boundly(m) & iris.SL<boundly(m+1));
%   disp(iris.Taxon(found_idx));
    % T1, T2, and T3
    for n=1:3;                
        % The strcmp below returns 1 or 0
        % so the sum of matching taxon is the count of the cell.
        cnt=sum(strncmp(iris.Taxon(found_idx),tx{n},length(tx{n})));
        ct(n,m)=cnt;        
    end;
end;
disp(ct);

% Finally, you got that contingency table.
% see table.png for another exaple when each taxon count is 50

%     39    11     0     0
%      3    17    28     1
%      0     3    38    10


%-------------------------------------------
% Verify the result

% Calculate total by group. Goes bottom row
total_g = sum(ct,1)
% 42    31    66    11

% Calculate total by taxon. Goes right col
total_t = sum(ct,2)
%     50
%     49
%     51

sum(sum(ct))
%   150

%----------------------------------------------
% Relative Contingency (Co-Occurrance) Table
% relative_contingency_table.png
rc = ct/total;
%     0.2600    0.0733         0         0
%     0.0200    0.1133    0.1867    0.0067
%          0    0.0200    0.2533    0.0667

% marginals...

sum(ct,1)/total
%    0.2800    0.2067    0.4400    0.0733

sum(ct,2)/total
%     0.3333
%     0.3267
%     0.3400


%-------------------------------------------
% Conditional Probability
% see conditional_probability.png
% http://www.mathworks.com/help/matlab/ref/bsxfun.html
cp=bsxfun(@rdivide, ct,total_g);

% Contingency Table for Sepal Length (G)
%     39    11     0     0
%      3    17    28     1
%      0     3    38    10

% divide by the total 
%     42    31    66    11

% p(T|G) ... "Conditional Probability" 
% Probability T over G
%           G1        G2        G3        G4
%T1     0.9286    0.3548         0         0
%T2     0.0714    0.5484    0.4242    0.0909
%T3          0    0.0968    0.5758    0.9091

%-------------------------------------------------------------------------
% This table indicates "Guess" from one value.
% For example, if you got a value between 4 and 5.3 cm (Group 1) 
% (see boundly)
% 92.86% of chance, it's Taxon1! (See cell 1,1)

%=========================================================================
% Part 2: Quetelet Index, Relative Freq, Independence and Chi-Square Test
%=========================================================================

%-------------------------------------------------------------------------
% However, the problem is, some values are indicative.
% That means, if each taxon count changes, the probability
% does not really represent anymore... 


% Assume H is Group of Sepal "Width"
% Let's think about the relations between Length and Width
% instead of Taxon and Length.
% Therefore, you take p(H|G) instead of p(T|G).
% This will not work, and it's called 
% "lack of correlation"


% -----------------------------------------------
% Generate Nominal Feture "H" via Sepal Width 
hist(iris.SW,20)

% Let's cut them into sections. see boundly2.png
boundly2=[2 2.5 2.9 3.5 4.3]
% Groups:
%   - H1: 2 - 2.5
%   - H2: 2.5 - 2.9
%   - H3: 2.9 - 3.5
%   - H4: 3.5 - 4.3


% Let's build a table for G (Length) and H (Width)
for m=1:4;    
    found_idx = find(iris.SL>=boundly(m) & iris.SL<boundly(m+1));
    for n=1:4;   
        cnt=length(find(iris.SW(found_idx) >= boundly2(n) & iris.SW(found_idx) < boundly2(n+1)));        
        ct2(n,m)=cnt;           
    end;
end;
disp(ct2);

% Contingency Table for Sepal Length (G) over Width (H) 
%       G1    G2    G3    G4
%H1      3     2     3     0
%H2      1    12    22     3
%H3     22     7    41     6
%H4     16    10     0     2

% Total of each G (bottom row)
sum(ct2,1)
%    42    31    66    11

% Total of each H (right col)
sum(ct2,2)
%      8
%     38
%     76
%     28

%-------------------------------------------
% A) Conditional Probability p(H|G) = Co-occurrance relative frequency
% see conditional_gh.png
total_g=sum(ct2,1);
% 42    31    66    11
total_h=sum(ct2,2);
%      8
%     38
%     76
%     28

cp2=bsxfun(@rdivide, ct2,total_g);
%     0.0714    0.0645    0.0455         0
%     0.0238    0.3871    0.3333    0.2727
%     0.5238    0.2258    0.6212    0.5455
%     0.3810    0.3226         0    0.1818

% margin bottom p(G)
pg = total_g / total;
%    0.2800    0.2067    0.4400    0.0733

% margin right p(H)
ph = total_h / total;
%     0.0533
%     0.2533
%     0.5067
%     0.1867

%-------------------------------------------
% B) Quetelet Index - "Relative Change from Average to G"
% see quetelet_index.png
% q(H|G) = [p(H|G) - p(H)] / p(H)
%
% where p(H|G) cp2 and p(H) is ph,
% q(H|G) is 
qhg = bsxfun(@rdivide,bsxfun(@minus, cp2,ph),ph);
%     0.3393    0.2097   -0.1477   -1.0000
%    -0.9060    0.5280    0.3158    0.0766
%     0.0338   -0.5543    0.2261    0.0766
%     1.0408    0.7281   -1.0000   -0.0260

% see quetelet_index_summary.png
    
qhg*100
%    33.9286   20.9677  -14.7727 -100.0000
%   -90.6015   52.8014   31.5789    7.6555
%     3.3835  -55.4329   22.6077    7.6555
%   104.0816   72.8111 -100.0000   -2.5974



%-------------------------------------------
% C) Independence Test
%
%  Observed Relative Frequency
%  v.s.
%  Frequency Expected Under Independence
%
%-------------------------------------------

% Contingency Relative Frequency Table A.K.A Observed Frequency
% (Total=1)
% Use ct2 H|G from above
% for H and G (Length and Width)
% contingency_relative_freq.png
fobs=ct2/total;
%     0.0149    0.0110    0.0235    0.0039
%     0.0709    0.0524    0.1115    0.0186
%     0.1419    0.1047    0.2229    0.0372
%     0.0523    0.0386    0.0821    0.0137
    
sum(sum(fobs))
% should be 1

% p(H) - marginal right col
ph=sum(ct2,2)/total;
%     0.0533
%     0.2533
%     0.5067
%     0.1867

% p(G) - marginal bottom row
pg=sum(ct2,1)/total;
%    0.2800    0.2067    0.4400    0.0733

% frequency expected under independence
% Let's check p(H) * p(G) - this is also total is 1
fexp=ph*pg;
%     0.0149    0.0110    0.0235    0.0039
%     0.0709    0.0524    0.1115    0.0186
%     0.1419    0.1047    0.2229    0.0372
%     0.0523    0.0386    0.0821    0.0137

% Now, observed frequency (crft) and frequency under independence (feui)
% differences are:

df=fexp-fobs;

%    -0.0051   -0.0023    0.0035    0.0039
%     0.0643   -0.0276   -0.0352   -0.0014
%    -0.0048    0.0580   -0.0504   -0.0028
%    -0.0544   -0.0281    0.0821    0.0004

% Which cell has differences more than 0.04 ???
over004=abs(df)>0.04
%      0     0     0     0
%      1     0     0     0
%      0     1     1     0
%      1     0     1     0

% Looks like only 5 of them got strong correlation.
% Other 11 of them are weakly correlated! not that good.

% see observed_vs_expected.png


%-------------------------------------------
% D) Chi-Square Test
%
% Let O=Observed, E=Expected
%
% Chi^2=sum((O-E)^2/E)
%
% Hypothesis: Features are independeint in the population
% Then: Density Function (f) of random var NX^2 (=chi^2)
%       with (K-1)(L-1) degree of freedom.
%
% Note: N is number of items (e.g. 150)
%-------------------------------------------
%
% Summary:
%   If the hypothetical chi-square distibution is 95% matching 
%   with observed dataset, you can almost say "they are same"
%
%   - "Hyposis of independence is True" :  5%
%   - "Hyposis of independence is False": 95%
%
% In our case we have 4 x 4 matrix.
% Let K=4, L=4.
%
% f(K,L) = (K-1)*(L-1)
% f(K,L) = 3 * 3
% f(K,L) = 9
%
% with f=9, there is 5% of change NX^2 could be greater than 16.92
%
% If N=150, NX^2 is 28.93 which is greater than 16.92.
%   -> The Independence is rejected.
%
% If N=50, NX^2 is 9.64 which is less than 16.92.
%   -> The Independence could not rejected
%
% see chisq.png
% 
% From Above Calculations, 
%   Freq. Observed : fobs
%   Freq. Expected : fexp

% Check Chi-Square == Summary Quetelet ???

%---------------------------------------------
% Chi Square from Observed & Expected Relative Frequency
df=fobs-fexp;
chi=(df.*df)./fexp;
chisq=sum(sum(chi));
% 0.2938

%---------------------------------------------
% Summary Quetelet qs
q=fobs./fexp-1;
qq=fobs.*q;
qs=sum(sum(qq))
% 0.2938


% Notice, Chi-Square (X^2) == Summary Quetelet (Q)
% Means, Q=X^2 is the average relative increase in occurrance H and G
% see chisq2.png. 

% P = min(K,L)-1


% continues...








