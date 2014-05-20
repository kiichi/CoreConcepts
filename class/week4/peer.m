% Find Queltet Index
ct=[0,1,7,39;
    0,13,28,7;
    16,22,9,1;
    31,12,4,0]

total=sum(sum(ct))
ph=sum(ct,2)/total; % p(H)
%pg=sum(ct,1)/total; % p(G)
cp=bsxfun(@rdivide, ct,sum(ct,1))
qi = bsxfun(@rdivide,bsxfun(@minus,cp,ph),ph)