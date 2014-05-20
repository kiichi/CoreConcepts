total = length(iris.PW);
hist(iris.PW,30);
max(iris.PW)
min(iris.PW)
boundly=[0 0.5 1.5 2.0 2.5];
tx={'I.setosa','I.versicolor','I.virginica'};
for m=1:4;    
    found_idx = find(iris.PW>boundly(m) & iris.PW<=boundly(m+1));
    for n=1:3;                
        cnt=sum(strncmp(iris.Taxon(found_idx),tx{n},length(tx{n})));
        ct(n,m)=cnt;        
    end;
end;
disp(ct);
total_g=sum(ct,1);
total_h=sum(ct,2);
cp=bsxfun(@rdivide, ct,total_g);
pg = total_g / total;
ph = total_h / total;
qhg = bsxfun(@rdivide,bsxfun(@minus, cp,ph),ph);
queted=qhg
queted_summary_index=qhg*100

fobs=ct/total;
fexp=ph*pg;

df=fobs-fexp;
chi=(df.*df)./fexp
chisq=sum(sum(chi))%chisq should be same as qs


q=fobs./fexp-1;
qq=fobs.*q;
qs=sum(sum(qq))

%answers
queted
%df %??
%chi %?? is this pearson index??
%queted_summary_index
pearson_index=sqrt(chi)