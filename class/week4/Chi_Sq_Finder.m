% Find Chi-sq
ct=[0,1,7,39;
    0,13,28,7;
    16,22,9,1;
    31,12,4,0]

total=sum(sum(ct))

ph=sum(ct,2)/total; % p(H)
pg=sum(ct,1)/total; % p(G)

% Observed 
fobs=ct/total

% Expected
fexp=ph*pg;


% Chi-Square = Sigma( (O-E)^2/E )
df=fobs-fexp;
chi=(df.*df)./fexp;
chisq=sum(sum(chi))


% Queted Index Summary (should be equal to Chi-Sq)
q=fobs./fexp-1;
qq=fobs.*q;
qs=sum(sum(qq))






% chisq =
% 
%     1.0112
% 
% 
% qs =
% 
%     1.0112

