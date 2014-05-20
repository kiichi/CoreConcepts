%-----------------------------------------
% Q1 - Gender x Spending
% $60=50ppl (male only)
% $100=20ppl (female only)
% $150=30ppl (half female / half male)

% S={S1,S2,S3}
% G={G1,G2}

%     50     0    15
%      0    20    15
tbl=[50,0,15;
    0,20,15];

% Append
tbl2=[tbl;sum(tbl,1)];
%     50     0    15
%      0    20    15
%     50    20    30


tbl3=[tbl2,sum(tbl2,2)]
%     50     0    15    65
%      0    20    15    35
%     50    20    30   100

%-----------------------------------------
% Question 2
% Find Quetelet index for females who spent 100$ each and express it per cent.

% $100 spending Female (2,2) = 20 ppl
% p(S2) = 20/20 = 1
% p(G2) = 35/100 = 0.35
% qi = 100*(1-0.35)/0.35 
% = 1.8571
%     50     0    15    65
%      0    20    15    35
%     50    20    30   100

%
%      1     0   0.5  0.65
%      0     1   0.5  0.35
%     50    20    30   100

% conditional probability
pgen=sum(tbl,2)/100; % p(G)

cp=bsxfun(@rdivide, tbl,sum(tbl,1))
%     1.0000         0    0.5000
%          0    1.0000    0.5000

qi = bsxfun(@rdivide,bsxfun(@minus,cp,pgen),pgen)
%     0.5385   -1.0000   -0.2308
%    -1.0000    1.8571    0.4286


%---------------------------------------------------------------
% Q3




%---------------------------------------------------------------
% Q4

ct=[169,21,140;
    83,25,68;
    286,10,28]

total=sum(sum(ct)) %830

%    169    21   140
%     83    25    68
%    286    10    28

% Let Columns G
% Let Rows H

ph=sum(ct,2)/total; % p(H)
pg=sum(ct,1)/total; % p(G)




cp=bsxfun(@rdivide, ct,sum(ct,1))
qi = bsxfun(@rdivide,bsxfun(@minus,cp,ph),ph)

%    -0.2099   -0.0568    0.4920
%    -0.2725    1.1053    0.3588
%     0.3618   -0.5425   -0.6961

qinew=[[qi,ph];286 10 28 830]

%    -0.2099   -0.0568    0.4920    0.3976
%    -0.2725    1.1053    0.3588    0.2120
%     0.3618   -0.5425   -0.6961    0.3904
%   286.0000   10.0000   28.0000  830.0000

%---------------------------------------------------------------
% Q5

% Observed 
fobs=ct/total
% Expected
fexp=ph*pg;


% Chi-Square
df=fobs-fexp;
chi=(df.*df)./fexp;
chisq=sum(sum(chi))


% Queted Index Summary
q=fobs./fexp-1;
qq=fobs.*q;
qs=sum(sum(qq))

% chi-sq is 0.1689




%---------------------------------------------------------------
% Q6

% 200 male total
% 100 total jogging
% 50 male jogging
% 
% J=J1,J2 Jogging Y,N
% S=S1,S2 Sex: M,F
ct=[50,150;
    50,250]
total=sum(sum(ct)) %500
%-----------------
%        J1    J2
% S1     50   150
% S2     50   250    
%-----------------
sum(sum(ct))


fobs=ct/total

% p(H) - marginal right col
ph=sum(ct,2)/total

pg=sum(ct,1)/total

fexp=ph*pg


df=fexp-fobs

over004=abs(df)>0.04



