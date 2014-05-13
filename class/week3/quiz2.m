p = polyfit(x,y,1);

%rho is...
cof=p(1) * std(x) / std(y)

%rho sqare = determinicy cof (= rsq)
cof^2

%-----------------------------------------
%fitting way (optional)
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal



